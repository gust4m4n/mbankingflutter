import '../../widget-x/all_widgets.dart';
import '../services/ekyc_data_service.dart';

class MbxEkycConfirmationController extends GetxController {
  var isSubmitting = false;

  // Getters to access EkycDataService data
  String? get selfiePath => EkycDataService.instance.selfiePath;
  String? get selfieKtpPath => EkycDataService.instance.selfieKtpPath;
  String? get ktpPhotoPath => EkycDataService.instance.ktpPhotoPath;

  bool get hasSelfiePath => selfiePath != null;
  bool get hasSelfieKtpPath => selfieKtpPath != null;
  bool get hasKtpPhotoPath => ktpPhotoPath != null;

  String get fullName => EkycDataService.instance.fullName;
  String get idNumber => EkycDataService.instance.idNumber;
  String get dateOfBirth => EkycDataService.instance.dateOfBirth;
  String get gender => EkycDataService.instance.gender;
  String get address => EkycDataService.instance.address;

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
