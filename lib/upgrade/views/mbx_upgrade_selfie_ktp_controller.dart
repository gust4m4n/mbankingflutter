import 'dart:io';

import '../../widget-x/all_widgets.dart';
import '../services/universal_camera_service.dart';
import '../services/upgrade_data_service.dart';

class MbxUpgradeSelfieKtpController extends GetxController {
  final UpgradeDataService _ekycService = Get.find<UpgradeDataService>();
  final UniversalCameraService _cameraService =
      Get.find<UniversalCameraService>();

  var isLoading = false.obs;
  var capturedPhoto = Rxn<dynamic>();

  @override
  void onInit() {
    super.onInit();
    print('🎯 MbxUpgradeSelfieKtpController initialized');
  }

  Future<void> btnCaptureClicked() async {
    if (isLoading.value) return;
    try {
      isLoading.value = true;
      print('📸 Starting selfie+KTP capture...');
      Get.dialog(
        AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text('Opening camera...'),
            ],
          ),
        ),
        barrierDismissible: false,
      );
      // Capture selfie+KTP with front camera
      final result = await _cameraService.captureSelfieKtp(
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      Get.back();
      if (result != null) {
        capturedPhoto.value = result;
        _ekycService.saveSelfieKtpPhoto(result);
        print('✅ Selfie+KTP captured successfully');
        // Tidak perlu tampilkan toast sukses
        // Don't automatically navigate - user needs to press Continue button
        // await Future.delayed(Duration(milliseconds: 1500));
        // btnNextClicked();
      } else {
        print('❌ No selfie+KTP captured');
        // Tidak perlu tampilkan toast error
      }
    } catch (e) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      print('❌ Error capturing selfie+KTP: $e');
      // Tidak perlu tampilkan toast error
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> btnGalleryClicked() async {
    if (isLoading.value) return;
    try {
      isLoading.value = true;
      print('🖼️ Opening gallery for selfie+KTP...');
      final result = await _cameraService.pickFromGallery(
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      if (result != null) {
        capturedPhoto.value = result;
        _ekycService.saveSelfieKtpPhoto(result);
        print('✅ Selfie+KTP selected from gallery');
        // Tidak perlu tampilkan toast sukses
      } else {
        print('❌ No photo selected from gallery');
      }
    } catch (e) {
      print('❌ Error selecting from gallery: $e');
      // Tidak perlu tampilkan toast error
    } finally {
      isLoading.value = false;
    }
  }

  void btnNextClicked() {
    if (!_ekycService.hasValidSelfieKtp()) {
      // Tidak perlu tampilkan toast error
      return;
    }
    print('➡️ Navigating to KTP Photo screen...');
    Get.toNamed('/ekyc-ktp-photo-universal');
  }

  void showPhotoOptions() {
    Get.bottomSheet(
      ContainerX(
        backgroundColor: ColorX.white,
        topLeftRadius: 20.0,
        topRightRadius: 20.0,
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextX(
              'Choose Photo Source',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: ColorX.black,
            ),
            ContainerX(height: 24.0),
            ButtonX(
              faIcon: Icons.camera_alt,
              title: 'Camera',
              clicked: () {
                Get.back();
                btnCaptureClicked();
              },
            ),
            ContainerX(height: 16.0),
            ButtonX(
              faIcon: Icons.photo_library,
              title: 'Gallery',
              backgroundColor: Colors.grey[200]!,
              titleColor: ColorX.black,
              clicked: () {
                Get.back();
                btnGalleryClicked();
              },
            ),
            ContainerX(height: 16.0),
            ButtonX(
              title: 'Cancel',
              backgroundColor: ColorX.lightGray,
              titleColor: ColorX.black,
              clicked: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  void btnBackClicked() {
    print('⬅️ Going back from selfie+KTP screen...');
    Get.back();
  }

  Widget buildPhotoWidget() {
    final photo = capturedPhoto.value ?? _ekycService.selfieKtpPhoto;
    if (photo == null) return SizedBox.shrink();
    if (photo is Uint8List) {
      return Image.memory(photo, fit: BoxFit.cover);
    } else if (photo is File) {
      return Image.file(photo, fit: BoxFit.cover);
    } else if (photo is String) {
      return Image.file(File(photo), fit: BoxFit.cover);
    }
    return SizedBox.shrink();
  }

  // Helper untuk StandardPhotoPreview - returns widget atau null
  Widget? getPhotoWidget() {
    final photo = capturedPhoto.value ?? _ekycService.selfieKtpPhoto;
    if (photo == null) return null;
    if (photo is Uint8List) {
      return Image.memory(photo, fit: BoxFit.cover);
    } else if (photo is File) {
      return Image.file(photo, fit: BoxFit.cover);
    } else if (photo is String) {
      return Image.file(File(photo), fit: BoxFit.cover);
    }
    return null;
  }

  @override
  void onClose() {
    print('🔄 MbxUpgradeSelfieKtpController disposed');
    super.onClose();
  }
}
