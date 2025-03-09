import 'dart:async';

import 'mbx_preferences_vm.dart';

extension MbxUserPreferencesVM on MbxPreferencesVM {
  static Future<void> setDeviceId(String value) async {
    await MbxPreferencesVM.setString(
        '827ded2ed0de828e53a430595e079ef19bbe7a1ae72ccb25417cf677e1110f6d',
        value);
  }

  static Future<String> getDeviceId() async {
    return await MbxPreferencesVM.getString(
        '827ded2ed0de828e53a430595e079ef19bbe7a1ae72ccb25417cf677e1110f6d');
  }

  static Future<void> setToken(String value) async {
    await MbxPreferencesVM.setString(
        '1cb9ed62e815e5c8bc0c3862da9a0c70c439df9b4e42a5c7c9fa82847f3b9d48',
        value);
  }

  static Future<String> getToken() async {
    return await MbxPreferencesVM.getString(
        '1cb9ed62e815e5c8bc0c3862da9a0c70c439df9b4e42a5c7c9fa82847f3b9d48');
  }

  static Future<void> setTheme(String value) async {
    await MbxPreferencesVM.setString(
        '74a17957b7c7743a8d6111edd891015c3b84d707a04b3bd9afe7c6bb3dbabbda',
        value);
  }

  static Future<String> getTheme() async {
    return await MbxPreferencesVM.getString(
        '74a17957b7c7743a8d6111edd891015c3b84d707a04b3bd9afe7c6bb3dbabbda');
  }

  static Future<void> setProfile(String value) async {
    await MbxPreferencesVM.setString(
        'ffaa1ca7884538c1f480d413a183db1c2df42f8cc5e6b48e791e07549d556796',
        value);
  }

  static Future<String> getProfile() async {
    return await MbxPreferencesVM.getString(
        'ffaa1ca7884538c1f480d413a183db1c2df42f8cc5e6b48e791e07549d556796');
  }

  static Future<void> setBiometricEnabled(bool value) async {
    await MbxPreferencesVM.setBool(
        'cdf873a5bb54af207213d87f283f433801695066fc4e0c6f9b5c41792214461a',
        value);
  }

  static Future<bool> getBiometricEnabled() async {
    return await MbxPreferencesVM.getBool(
        'cdf873a5bb54af207213d87f283f433801695066fc4e0c6f9b5c41792214461a');
  }

  static Future<void> resetAll() async {
    await setToken('');
    await setTheme('');
    await setProfile('');
    await setBiometricEnabled(false);
    await MbxPreferencesVM.deleteAll();
  }
}
