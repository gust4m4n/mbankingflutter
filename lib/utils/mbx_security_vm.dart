import 'dart:typed_data';
import '../utils/all_utils.dart';

class MbxSecurityVM {
  static String securityKey =
      '09a3de1355af0cd9298b3c19c46312346e858bd0fdcfc29be59cc41db8d7edf8';

  static Uint8List generateEncryptionKey() {
    var reversedChars = securityKey.split('');
    final reversedKey = reversedChars.reversed.join();
    final crc = CrcUtils.convert(Utf8Utils.encode(reversedKey));
    final xorKey =
        XorUtils.encrypt(Utf8Utils.encode(reversedKey), Utf8Utils.encode(crc));
    final finalKey = ShaUtils.convert(xorKey);
    return finalKey;
  }

  static Uint8List generateEncryptionIV() {
    final crc = CrcUtils.convert(Utf8Utils.encode(securityKey));
    final hex = HexUtils.encode(Utf8Utils.encode(crc));
    final rep = hex * 32;
    final prefix = rep.substring(0, 32);
    return HexUtils.decode(prefix);
  }

  static Uint8List doubleEncrypt(Uint8List plain) {
    if (plain.isNotEmpty) {
      var finalKey = generateEncryptionKey();
      final encrypted =
          AesUtils.encrypt(plain, finalKey, generateEncryptionIV());
      return encrypted;
    } else {
      return Uint8List(0);
    }
  }

  static Uint8List doubleDecrypt(Uint8List encrypted) {
    if (encrypted.isNotEmpty) {
      var finalKey = generateEncryptionKey();
      final decrypted =
          AesUtils.decrypt(encrypted, finalKey, generateEncryptionIV());
      return decrypted;
    } else {
      return Uint8List(0);
    }
  }
}
