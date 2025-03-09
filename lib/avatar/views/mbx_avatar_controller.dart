import '../../widgets/all_widgets.dart';

class MbxAvatarController extends GetxController {
  btnCloseClicked() {
    Get.back();
  }

  btnCameraClicked() async {
    Get.back();
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 1024.0,
        maxHeight: 1024.0,
        preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null) {
      // photoSelfie = pickedFile.path;
      Get.back();
    }
  }

  btnGalleryClicked() async {
    Get.back();
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 1024.0,
        maxHeight: 1024.0,
        preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null) {
      // photoSelfie = pickedFile.path;
      Get.back();
    }
  }
}
