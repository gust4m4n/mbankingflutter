import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mbx_security_vm.dart';
import '../utils/all_utils.dart';

class MbxPreferencesVM {
  static String encodeKey(String key) {
    final xorKey = XorUtils.encrypt(
        Utf8Utils.encode(key), MbxSecurityVM.generateEncryptionKey());
    return Base64Utils.encode(xorKey);
  }

  static Future<void> setString(String key, String value) async {
    var prefKey = encodeKey(key);
    final encrypted = MbxSecurityVM.doubleEncrypt(Utf8Utils.encode(value));
    if (kIsWeb) {
      final storage = await SharedPreferences.getInstance();
      await storage.setString(prefKey, Base64Utils.encode(encrypted));
    } else {
      const storage = FlutterSecureStorage();
      return await storage.write(
          key: prefKey, value: Base64Utils.encode(encrypted));
    }
  }

  static Future<String> getString(String key) async {
    var prefKey = encodeKey(key);
    if (kIsWeb) {
      final storage = await SharedPreferences.getInstance();
      String? value = storage.getString(prefKey);
      if (value != null) {
        return Utf8Utils.decode(
            MbxSecurityVM.doubleDecrypt(Base64Utils.decode(value)));
      } else {
        return '';
      }
    } else {
      const storage = FlutterSecureStorage();
      String? value = await storage.read(key: prefKey);
      if (value != null) {
        return Utf8Utils.decode(
            MbxSecurityVM.doubleDecrypt(Base64Utils.decode(value)));
      } else {
        return '';
      }
    }
  }

  static Future<void> setInt(String key, int value) async {
    await setString(key, value.toString());
  }

  static Future<int> getInt(String key) async {
    String value = await getString(key);
    if (value.isEmpty) {
      return 0;
    }
    return int.parse(value);
  }

  static Future<void> setDouble(String key, double value) async {
    await setString(key, value.toString());
  }

  static Future<double> getDouble(String key) async {
    var value = await getString(key);
    if (value.isEmpty) {
      return 0.0;
    }
    return double.parse(value);
  }

  static Future<void> setBool(String key, bool value) async {
    await setString(key, value == true ? '1' : '0');
  }

  static Future<bool> getBool(String key) async {
    var value = await getString(key);
    if (value.isEmpty) {
      return false;
    }
    return int.parse(value) == 1 ? true : false;
  }

  static Future<bool> setStringUnsecure(String key, String value) async {
    final storage = await SharedPreferences.getInstance();
    var prefKey = encodeKey(key);
    if (value.isNotEmpty) {
      final encrypted = MbxSecurityVM.doubleEncrypt(Utf8Utils.encode(value));
      return await storage.setString(prefKey, Base64Utils.encode(encrypted));
    } else {
      return await storage.setString(prefKey, '');
    }
  }

  static Future<String> getStringUnsecure(String key) async {
    final storage = await SharedPreferences.getInstance();
    var prefKey = encodeKey(key);
    String? value = storage.getString(prefKey);
    if (value != null && value.isNotEmpty) {
      return Utf8Utils.decode(
          MbxSecurityVM.doubleDecrypt(Base64Utils.decode(value)));
    } else {
      return '';
    }
  }

  static Future<void> setBoolUnsecure(String key, bool value) async {
    await setStringUnsecure(key, value == true ? '1' : '0');
  }

  static Future<bool> getBoolUnsecure(String key) async {
    var value = await getStringUnsecure(key);
    if (value.isEmpty) {
      return false;
    }
    return int.parse(value) == 1 ? true : false;
  }

  static Future<void> setFreshInstall(bool value) async {
    var flag = true;
    if (value == true) {
      flag = false;
    }
    await setBoolUnsecure(
        '4dfd926498303ddc6dccd25c4289012e25102e2eb2ce7565cd3eec53e2c71315',
        flag);
  }

  static Future<bool> getFreshInstall() async {
    var value = await getBoolUnsecure(
        '4dfd926498303ddc6dccd25c4289012e25102e2eb2ce7565cd3eec53e2c71315');
    if (value == false) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> deleteAll() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }

  static demo() async {
    if (kDebugMode) {
      LoggerX.log('[PREF] security key: ${MbxSecurityVM.securityKey}');
      LoggerX.log(
          '[PREF] encryption key: ${HexUtils.encode(MbxSecurityVM.generateEncryptionKey())}');
      LoggerX.log(
          '[PREF] encryption IV: ${HexUtils.encode(MbxSecurityVM.generateEncryptionIV())}');
      const key =
          "97283b39a7866ed6ed9d5520b746cc5079a7abed640122ec0763aa759a03dd83";
      LoggerX.log('[PREF] key plain: $key');
      LoggerX.log('[PREF] key encoded: ${encodeKey(key)}');

      var value = LoremIpsumX.tiny();
      LoggerX.log('[PREF] value plain: $value');
      var encrypted = Base64Utils.encode(
          MbxSecurityVM.doubleEncrypt(Utf8Utils.encode(value)));
      LoggerX.log('[PREF] value encrypted: $encrypted');
      var decrypted =
          MbxSecurityVM.doubleDecrypt(Base64Utils.decode(encrypted));
      LoggerX.log('[PREF] value decrypted: ${Utf8Utils.decode(decrypted)}');

      value = LoremIpsumX.medium();
      LoggerX.log('[PREF] value plain: $value');
      encrypted = Base64Utils.encode(
          MbxSecurityVM.doubleEncrypt(Utf8Utils.encode(value)));
      LoggerX.log('[PREF] value encrypted: $encrypted');
      decrypted = MbxSecurityVM.doubleDecrypt(Base64Utils.decode(encrypted));
      LoggerX.log('[PREF] value decrypted: ${Utf8Utils.decode(decrypted)}');

      var valueString = 'Hello World!';
      await setString('valueString', valueString);
      valueString = await getString('valueString');
      LoggerX.log('[PREF] valueString: $valueString');

      var valueInt = 123456789;
      await setInt('valueInt', valueInt);
      valueInt = await getInt('valueInt');
      LoggerX.log('[PREF] valueInt: $valueInt');

      var valueDouble = 250.123;
      await setDouble('valueDouble', valueDouble);
      valueDouble = await getDouble('valueDouble');
      LoggerX.log('[PREF] valueDouble: $valueDouble');

      var valueBool = true;
      await setBool('valueBool', valueBool);
      valueBool = await getBool('valueBool');
      LoggerX.log('[PREF] valueBool: $valueBool');
    }
  }
}
