import 'package:camera/camera.dart';

import '../../widget-x/all_widgets.dart';

class MbxEkycKtpPhotoController extends GetxController {
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
        // Use back camera for ID card photo
        CameraDescription backCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back,
          orElse: () => cameras.first,
        );

        cameraController = CameraController(
          backCamera,
          ResolutionPreset.high,
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
    if (cameraController != null &&
        isCameraInitialized &&
        cameraController!.value.isInitialized) {
      try {
        final XFile photo = await cameraController!.takePicture();
        // TODO: Save photo and proceed
        print('KTP Photo captured: ${photo.path}');

        // Navigate to next screen
        Get.toNamed('/ekyc/data-entry');
      } catch (e) {
        print('Error capturing photo: $e');
      }
    } else {
      print('Camera not ready for capture');
    }
  }
}
