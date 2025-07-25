import 'package:get/get.dart';

class EkycDataService extends GetxService {
  static EkycDataService get instance => Get.find<EkycDataService>();

  @override
  void onInit() {
    super.onInit();
    print('✅ EkycDataService initialized and ready to use');
  }

  // Captured photos
  String? selfiePath;
  String? selfieKtpPath;
  String? ktpPhotoPath;

  // Personal information
  String fullName = '';
  String idNumber = '';
  String dateOfBirth = '';
  String gender = '';
  String address = '';

  // Methods to save captured photos
  void saveSelfiePhoto(String path) {
    selfiePath = path;
  }

  void saveSelfieKtpPhoto(String path) {
    selfieKtpPath = path;
  }

  void saveKtpPhoto(String path) {
    ktpPhotoPath = path;
  }

  // Methods to save personal data
  void savePersonalData({
    required String fullName,
    required String idNumber,
    required String dateOfBirth,
    required String gender,
    required String address,
  }) {
    this.fullName = fullName;
    this.idNumber = idNumber;
    this.dateOfBirth = dateOfBirth;
    this.gender = gender;
    this.address = address;
  }

  // Clear all data
  void clearData() {
    selfiePath = null;
    selfieKtpPath = null;
    ktpPhotoPath = null;
    fullName = '';
    idNumber = '';
    dateOfBirth = '';
    gender = '';
    address = '';
  }

  // Check if all photos are captured
  bool get hasAllPhotos {
    return selfiePath != null && selfieKtpPath != null && ktpPhotoPath != null;
  }

  // Check if personal data is complete
  bool get hasPersonalData {
    return fullName.isNotEmpty &&
        idNumber.isNotEmpty &&
        dateOfBirth.isNotEmpty &&
        gender.isNotEmpty &&
        address.isNotEmpty;
  }
}
