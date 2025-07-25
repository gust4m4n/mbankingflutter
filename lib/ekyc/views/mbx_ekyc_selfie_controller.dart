import 'dart:io';

import 'package:camera/camera.dart';

import '../../widget-x/all_widgets.dart';
import '../services/ekyc_data_service.dart';

class MbxEkycSelfieController extends GetxController {
  CameraController? cameraController;
  bool isCameraInitialized = false;
  List<CameraDescription> cameras = [];

  @override
  void onInit() {
    super.onInit();
    _requestPermissionsAndInitialize();
  }

  Future<void> _requestPermissionsAndInitialize() async {
    try {
      // Add small delay to ensure UI is ready
      await Future.delayed(Duration(milliseconds: 500));
      await initializeCamera();
    } catch (e) {
      print('Error in permission/initialization: $e');
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }

  Future<void> initializeCamera() async {
    try {
      print('Starting camera initialization...');

      // Dispose existing controller if any
      if (cameraController != null) {
        await cameraController!.dispose();
        cameraController = null;
      }

      cameras = await availableCameras();
      print('Available cameras: ${cameras.length}');

      if (cameras.isEmpty) {
        throw Exception('No cameras available on this device');
      }

      // Use front camera for selfie
      CameraDescription frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      print(
        'Selected camera: ${frontCamera.name}, Direction: ${frontCamera.lensDirection}',
      );

      cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg, // Explicitly set format
      );

      print('Initializing camera controller...');
      await cameraController!.initialize();

      // Add extra verification
      await Future.delayed(Duration(milliseconds: 100));

      if (cameraController!.value.isInitialized) {
        isCameraInitialized = true;
        print('✅ Camera is ready for use');
        update();
      } else {
        throw Exception(
          'Camera initialization failed - value not properly initialized',
        );
      }
    } catch (e) {
      print('❌ Camera initialization error: $e');
      print('Error type: ${e.runtimeType}');
      isCameraInitialized = false;

      // Clean up
      if (cameraController != null) {
        try {
          await cameraController!.dispose();
        } catch (disposeError) {
          print('Error disposing camera: $disposeError');
        }
        cameraController = null;
      }

      update();

      // Show user-friendly error message
      String message = 'Failed to initialize camera.';
      if (e.toString().contains('permission')) {
        message =
            'Camera permission denied. Please grant camera access in settings.';
      } else if (e.toString().contains('No cameras available')) {
        message = 'No camera found on this device.';
      }

      Get.snackbar(
        'Camera Error',
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 5),
      );
    }
  }

  btnBackClicked() {
    Get.back();
  }

  Future<void> retryCamera() async {
    print('🔄 Retrying camera initialization...');
    isCameraInitialized = false;
    update();
    await initializeCamera();
  }

  Future<void> btnCaptureClicked() async {
    print('=== CAPTURE BUTTON CLICKED ===');
    print('Camera controller null: ${cameraController == null}');
    print('Camera initialized flag: $isCameraInitialized');
    print('Camera value initialized: ${cameraController?.value.isInitialized}');
    print('Camera value: ${cameraController?.value}');

    if (cameraController == null) {
      print('ERROR: Camera controller is null');
      Get.snackbar(
        'Camera Error',
        'Camera not initialized. Please restart the screen.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return;
    }

    if (!isCameraInitialized || !cameraController!.value.isInitialized) {
      print('ERROR: Camera not properly initialized');
      Get.snackbar(
        'Camera Not Ready',
        'Please wait for camera to initialize completely.',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return;
    }

    try {
      print('=== STARTING PHOTO CAPTURE ===');

      // Check if camera is still active
      if (cameraController!.value.isRecordingVideo) {
        print('ERROR: Camera is recording video');
        throw Exception('Camera is busy recording video');
      }

      if (!cameraController!.value.isInitialized) {
        print('ERROR: Camera lost initialization');
        throw Exception('Camera lost initialization');
      }

      print('Taking picture now...');
      final XFile photo = await cameraController!.takePicture();
      print('Photo taken successfully!');
      print('Photo path: ${photo.path}');
      print('Photo length: ${await photo.length()} bytes');

      // Verify file exists
      final file = File(photo.path);
      final exists = await file.exists();
      print('Photo file exists: $exists');

      if (!exists) {
        throw Exception('Photo file was not created');
      }

      // Save photo path to service
      print('Accessing EkycDataService...');
      try {
        EkycDataService.instance.saveSelfiePhoto(photo.path);
        print('Photo saved to service: ${photo.path}');
      } catch (serviceError) {
        print('Error accessing EkycDataService: $serviceError');
        throw Exception('Failed to save photo to service: $serviceError');
      }

      // Show success message
      Get.snackbar(
        'Success',
        'Selfie captured successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );

      // Small delay before navigation
      await Future.delayed(Duration(milliseconds: 500));

      // Navigate to next screen
      print('Navigating to next screen...');
      Get.toNamed('/ekyc/selfie-ktp');
    } catch (e) {
      print('=== CAPTURE ERROR ===');
      print('Error capturing photo: $e');
      print('Error type: ${e.runtimeType}');
      print('Stack trace: ${StackTrace.current}');

      String errorMessage = 'Failed to capture photo. Please try again.';

      // Provide more specific error messages
      if (e.toString().contains('permissions')) {
        errorMessage = 'Camera permission denied. Please grant camera access.';
      } else if (e.toString().contains('busy') ||
          e.toString().contains('recording')) {
        errorMessage = 'Camera is busy. Please wait and try again.';
      } else if (e.toString().contains('initialization') ||
          e.toString().contains('disposed')) {
        errorMessage = 'Camera disconnected. Please restart the screen.';
      }

      Get.snackbar(
        'Capture Failed',
        errorMessage,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 4),
      );

      // Try to reinitialize camera if it seems to be the issue
      if (e.toString().contains('initialization') ||
          e.toString().contains('disposed')) {
        print('Attempting to reinitialize camera...');
        await initializeCamera();
      }
    }
  }
}
