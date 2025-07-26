import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UpgradeDataService extends GetxService {
  static UpgradeDataService get instance => Get.find<UpgradeDataService>();

  @override
  void onInit() {
    super.onInit();
    print('✅ UpgradeDataService initialized and ready to use');
  }

  // Captured photos - support both File and Uint8List for cross-platform
  dynamic selfiePhoto;
  dynamic selfieKtpPhoto;
  dynamic ktpPhoto;

  // Personal information
  String fullName = '';
  String idNumber = '';
  String dateOfBirth = '';
  String gender = '';
  String address = '';

  // Methods to save captured photos (universal support)
  void saveSelfiePhoto(dynamic photo) {
    selfiePhoto = photo;
    print('✅ Selfie photo saved: ${_getPhotoInfo(photo)}');
  }

  void saveSelfieKtpPhoto(dynamic photo) {
    selfieKtpPhoto = photo;
    print('✅ Selfie KTP photo saved: ${_getPhotoInfo(photo)}');
  }

  void saveKtpPhoto(dynamic photo) {
    ktpPhoto = photo;
    print('✅ KTP photo saved: ${_getPhotoInfo(photo)}');
  }

  // Helper method to get photo info
  String _getPhotoInfo(dynamic photo) {
    if (photo is File) {
      return 'File: ${photo.path} (${photo.lengthSync()} bytes)';
    } else if (photo is Uint8List) {
      return 'Bytes: ${photo.length} bytes';
    } else if (photo is String) {
      return 'Path: $photo';
    }
    return 'Unknown type: ${photo.runtimeType}';
  }

  // Check if photo exists and is valid
  bool hasValidSelfie() => selfiePhoto != null;
  bool hasValidSelfieKtp() => selfieKtpPhoto != null;
  bool hasValidKtpPhoto() => ktpPhoto != null;

  // Get photo size in bytes
  int getPhotoSize(dynamic photo) {
    if (photo is File) {
      return photo.lengthSync();
    } else if (photo is Uint8List) {
      return photo.length;
    }
    return 0;
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
    print('✅ Personal data saved: $fullName ($idNumber)');
  }

  // Clear all data
  void clearData() {
    selfiePhoto = null;
    selfieKtpPhoto = null;
    ktpPhoto = null;
    fullName = '';
    idNumber = '';
    dateOfBirth = '';
    gender = '';
    address = '';
    print('🗑️ All eKYC data cleared');
  }

  // Check if all photos are captured
  bool get hasAllPhotos {
    return hasValidSelfie() && hasValidSelfieKtp() && hasValidKtpPhoto();
  }

  // Check if personal data is complete
  bool get hasPersonalData {
    return fullName.isNotEmpty &&
        idNumber.isNotEmpty &&
        dateOfBirth.isNotEmpty &&
        gender.isNotEmpty &&
        address.isNotEmpty;
  }

  // Check if eKYC process is complete
  bool get isComplete {
    return hasAllPhotos && hasPersonalData;
  }
}
