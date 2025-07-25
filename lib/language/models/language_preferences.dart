import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagePreferences {
  static const String _languageKey = 'selected_language';

  // Get saved language code
  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'id'; // Default to Indonesian
  }

  // Save language code
  static Future<void> setLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  // Get Locale object from saved language
  static Future<Locale> getLocale() async {
    final languageCode = await getLanguage();
    return Locale(languageCode);
  }

  // Available languages
  static const List<Map<String, String>> supportedLanguages = [
    {'code': 'id', 'name': 'Indonesia', 'flag': '🇮🇩'},
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸'},
  ];

  // Get language name by code
  static String getLanguageName(String code) {
    final language = supportedLanguages.firstWhere(
      (lang) => lang['code'] == code,
      orElse: () => supportedLanguages.first,
    );
    return language['name'] ?? 'Indonesia';
  }

  // Get language flag by code
  static String getLanguageFlag(String code) {
    final language = supportedLanguages.firstWhere(
      (lang) => lang['code'] == code,
      orElse: () => supportedLanguages.first,
    );
    return language['flag'] ?? '🇮🇩';
  }
}
