import '../../widget-x/all_widgets.dart';
import '../services/ekyc_data_service.dart';

class MbxEkycConfirmationController extends GetxController {
  var isSubmitting = false;

  // Getters to access EkycDataService data
  dynamic get selfiePhoto => EkycDataService.instance.selfiePhoto;
  dynamic get selfieKtpPhoto => EkycDataService.instance.selfieKtpPhoto;
  dynamic get ktpPhoto => EkycDataService.instance.ktpPhoto;

  bool get hasSelfiePhoto => EkycDataService.instance.hasValidSelfie();
  bool get hasSelfieKtpPhoto => EkycDataService.instance.hasValidSelfieKtp();
  bool get hasKtpPhoto => EkycDataService.instance.hasValidKtpPhoto();

  // Path getters for compatibility with screen
  bool get hasSelfiePath => EkycDataService.instance.hasValidSelfie();
  bool get hasSelfieKtpPath => EkycDataService.instance.hasValidSelfieKtp();
  bool get hasKtpPhotoPath => EkycDataService.instance.hasValidKtpPhoto();

  String? get selfiePath => EkycDataService.instance.selfiePhoto?.path;
  String? get selfieKtpPath => EkycDataService.instance.selfieKtpPhoto?.path;
  String? get ktpPhotoPath => EkycDataService.instance.ktpPhoto?.path;

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
