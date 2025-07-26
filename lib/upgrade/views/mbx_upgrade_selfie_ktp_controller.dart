import 'dart:io';

import '../../widget-x/all_widgets.dart';
import '../services/upgrade_data_service.dart';
import '../services/universal_camera_service.dart';

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
        await Future.delayed(Duration(milliseconds: 1500));
        btnNextClicked();
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

  @override
  void onClose() {
    print('🔄 MbxUpgradeSelfieKtpController disposed');
    super.onClose();
  }
}
