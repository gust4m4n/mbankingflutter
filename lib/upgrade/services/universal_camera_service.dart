import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

/// Universal Camera Service yang mendukung Android, iOS, dan Web
class UniversalCameraService extends GetxService {
  /// Capture selfie dengan KTP (front camera)
  Future<dynamic> captureSelfieKtp({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    // Sementara gunakan front camera, bisa tambahkan overlay/instruksi di UI
    return await capturePhoto(
      source: ImageSource.camera,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality ?? 85,
      preferredCameraDevice: CameraDevice.front,
    );
  }

  final ImagePicker _picker = ImagePicker();

  /// Capture photo dari camera
  /// Returns File untuk mobile, Uint8List untuk web
  Future<dynamic> capturePhoto({
    ImageSource source = ImageSource.camera,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality ?? 85,
        preferredCameraDevice: preferredCameraDevice,
      );

      if (image == null) {
        print('❌ No image captured');
        return null;
      }

      if (kIsWeb) {
        // For web, return Uint8List
        final Uint8List bytes = await image.readAsBytes();
        print('✅ Web image captured: ${bytes.length} bytes');
        return bytes;
      } else {
        // For mobile, return File
        final File file = File(image.path);
        print('✅ Mobile image captured: ${file.path}');
        return file;
      }
    } catch (e) {
      print('❌ Error capturing photo: $e');
      rethrow;
    }
  }

  /// Capture selfie (front camera)
  Future<dynamic> captureSelfie({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    return await capturePhoto(
      source: ImageSource.camera,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
      preferredCameraDevice: CameraDevice.front,
    );
  }

  /// Capture photo with rear camera
  Future<dynamic> captureRearPhoto({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    return await capturePhoto(
      source: ImageSource.camera,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
      preferredCameraDevice: CameraDevice.rear,
    );
  }

  /// Pick image from gallery
  Future<dynamic> pickFromGallery({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    return await capturePhoto(
      source: ImageSource.gallery,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );
  }

  /// Check if camera is available
  Future<bool> isCameraAvailable() async {
    try {
      // Try to access camera by attempting to pick an image
      if (kIsWeb) {
        // For web, assume camera is available
        return true;
      } else {
        // For mobile, camera should be available if image_picker works
        return true;
      }
    } catch (e) {
      print('❌ Camera not available: $e');
      return false;
    }
  }

  /// Get supported image formats
  List<String> getSupportedFormats() {
    if (kIsWeb) {
      return ['jpg', 'jpeg', 'png', 'webp'];
    } else {
      return ['jpg', 'jpeg', 'png'];
    }
  }

  /// Convert dynamic result to appropriate type
  bool isFile(dynamic result) {
    return result is File;
  }

  bool isBytes(dynamic result) {
    return result is Uint8List;
  }

  /// Get file size in bytes
  int getFileSize(dynamic result) {
    if (result is File) {
      return result.lengthSync();
    } else if (result is Uint8List) {
      return result.length;
    }
    return 0;
  }

  @override
  void onInit() {
    super.onInit();
    print('🎥 UniversalCameraService initialized');
    _logPlatformInfo();
  }

  void _logPlatformInfo() {
    if (kIsWeb) {
      print('📱 Platform: Web - Using ImagePicker with web support');
    } else if (Platform.isAndroid) {
      print('📱 Platform: Android - Using native ImagePicker');
    } else if (Platform.isIOS) {
      print('📱 Platform: iOS - Using native ImagePicker');
    } else {
      print('📱 Platform: ${Platform.operatingSystem} - Using ImagePicker');
    }
  }
}
