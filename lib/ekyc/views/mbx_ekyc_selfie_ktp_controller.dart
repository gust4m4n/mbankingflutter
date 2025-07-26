// DEPRECATED: This file uses old camera plugin that doesn't support web
/*
import 'package:camera/camera.dart';

import '../../widget-x/all_widgets.dart';
import '../services/ekyc_data_service.dart';

class MbxEkycSelfieKtpController extends GetxController {
  CameraController? cameraController;
  bool isCameraInitialized = false;
  List<CameraDescription> cameras = [];

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        // Use front camera for selfie with KTP
        CameraDescription frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => cameras.first,
        );

        cameraController = CameraController(
          frontCamera,
          ResolutionPreset.medium,
          enableAudio: false,
        );

        await cameraController?.initialize();
        if (cameraController?.value.isInitialized == true) {
          isCameraInitialized = true;
          update();
        }
      }
    } catch (e) {
      print('Camera initialization error: $e');
      isCameraInitialized = false;
      update();
    }
  }

  btnBackClicked() {
    Get.back();
  }

  Future<void> btnCaptureClicked() async {
    print('Selfie+KTP capture button clicked');
    print('Camera controller null: ${cameraController == null}');
    print('Camera initialized: $isCameraInitialized');
    print('Camera value initialized: ${cameraController?.value.isInitialized}');

    if (cameraController != null &&
        isCameraInitialized &&
        cameraController!.value.isInitialized) {
      try {
        print('Taking selfie+KTP picture...');
        final XFile photo = await cameraController!.takePicture();
        // Save photo path to service
        EkycDataService.instance.saveSelfieKtpPhoto(photo.path);
        print('Selfie with KTP captured: ${photo.path}');

        // Show success message
        Get.snackbar(
          'Success',
          'Photo captured successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 2),
        );

        // Navigate to next screen
        Get.toNamed('/ekyc-ktp-photo-universal');
      } catch (e) {
        print('Error capturing photo: $e');
        Get.snackbar(
          'Error',
          'Failed to capture photo. Please try again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    } else {
      print('Camera not ready for capture');
      Get.snackbar(
        'Camera Not Ready',
        'Please wait for camera to initialize',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    }
  }
}
*/
