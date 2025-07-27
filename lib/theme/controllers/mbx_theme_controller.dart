import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MbxThemeController extends GetxController {
  static const String _isDarkModeKey = 'isDarkMode';

  final RxBool _isDarkMode = false.obs;
  final RxString _currentThemeColor = ''.obs;

  bool get isDarkMode => _isDarkMode.value;
  String get currentThemeColor => _currentThemeColor.value;

  ThemeMode get themeMode =>
      _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  void _loadThemeFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getBool(_isDarkModeKey) ?? false;
    _isDarkMode.value = savedTheme;
    print('🎨 Theme loaded: ${_isDarkMode.value ? "Dark" : "Light"} mode');
    update();
  }

  void toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;

    // Force rebuild first to show immediate UI change
    update();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDarkModeKey, _isDarkMode.value);

    // Update app theme and force app update
    Get.changeThemeMode(themeMode);
    Get.forceAppUpdate();

    print('🎨 Theme switched to: ${_isDarkMode.value ? "Dark" : "Light"} mode');

    // Force rebuild again to ensure all components update
    update();
  }

  void setDarkMode(bool isDark) async {
    _isDarkMode.value = isDark;

    // Force rebuild first to show immediate UI change
    update();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDarkModeKey, isDark);

    // Update app theme and force app update
    Get.changeThemeMode(themeMode);
    Get.forceAppUpdate();

    print('🎨 Theme set to: ${isDark ? "Dark" : "Light"} mode');

    // Force rebuild again to ensure all components update
    update();
  }

  // Method to trigger rebuild when theme color changes
  void notifyThemeColorChanged([String? hexColor]) {
    if (hexColor != null) {
      _currentThemeColor.value = hexColor;
    }
    update();
    Get.forceAppUpdate();
    print('🎨 Theme color changed to: ${hexColor ?? "unknown"}, UI updated');
  }
}
