import 'dart:io';

import '../../widget-x/all_widgets.dart';
import '../services/upgrade_data_service.dart';

class MbxUpgradeConfirmationController extends GetxController {
  var isSubmitting = false;

  // Getters to access UpgradeDataService data
  dynamic get selfiePhoto => UpgradeDataService.instance.selfiePhoto;
  dynamic get selfieKtpPhoto => UpgradeDataService.instance.selfieKtpPhoto;
  dynamic get ktpPhoto => UpgradeDataService.instance.ktpPhoto;

  bool get hasSelfiePhoto => UpgradeDataService.instance.hasValidSelfie();
  bool get hasSelfieKtpPhoto => UpgradeDataService.instance.hasValidSelfieKtp();
  bool get hasKtpPhoto => UpgradeDataService.instance.hasValidKtpPhoto();

  // Path getters for compatibility with screen
  bool get hasSelfiePath => UpgradeDataService.instance.hasValidSelfie();
  bool get hasSelfieKtpPath => UpgradeDataService.instance.hasValidSelfieKtp();
  bool get hasKtpPhotoPath => UpgradeDataService.instance.hasValidKtpPhoto();

  String? get selfiePath {
    final photo = UpgradeDataService.instance.selfiePhoto;
    if (photo is File) {
      return photo.path;
    } else if (photo is String) {
      return photo;
    }
    return null;
  }

  String? get selfieKtpPath {
    final photo = UpgradeDataService.instance.selfieKtpPhoto;
    if (photo is File) {
      return photo.path;
    } else if (photo is String) {
      return photo;
    }
    return null;
  }

  String? get ktpPhotoPath {
    final photo = UpgradeDataService.instance.ktpPhoto;
    if (photo is File) {
      return photo.path;
    } else if (photo is String) {
      return photo;
    }
    return null;
  }

  String get fullName => UpgradeDataService.instance.fullName;
  String get idNumber => UpgradeDataService.instance.idNumber;
  String get dateOfBirth => UpgradeDataService.instance.dateOfBirth;
  String get gender => UpgradeDataService.instance.gender;
  String get address => UpgradeDataService.instance.address;

  btnBackClicked() {
    Get.back();
  }

  btnSubmitClicked() async {
    isSubmitting = true;
    update();

    // Simulate submission process
    await Future.delayed(Duration(seconds: 2));

    isSubmitting = false;
    update();

    // Navigate to success screen
    Get.toNamed('/ekyc/success');
  }
}
