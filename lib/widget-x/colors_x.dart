import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/controllers/mbx_theme_controller.dart';

class ColorX {
  static const Color blue = Color(0xff007bff);
  static const Color teal = Color(0xff17a2b8);
  static const Color green = Color(0xff28a745);
  static const Color yellow = Color(0xffffc107);
  static const Color red = Color(0xffdc3545);

  // Light theme colors
  static const Color _lightBlack = Color(0xff343a40);
  static const Color _lightGray = Color(0xff6c757d);
  static const Color _lightLightGray = Color(0xffd3d3d3);
  static const Color _lightWhite = Colors.white;
  static const Color _lightHighlight = Color(0xffE3E3E3);

  // Dark theme colors
  static const Color _darkBlack = Color(
    0xffe8e8e8,
  ); // Soft white text in dark mode
  static const Color _darkGray = Color(0xffb0b0b0); // Light gray in dark mode
  static const Color _darkLightGray = Color(
    0xff4a4a4c,
  ); // Soft dark gray for backgrounds
  static const Color _darkWhite = Color(
    0xff2d2d30,
  ); // Soft dark background (VS Code dark theme inspired)
  static const Color _darkHighlight = Color(
    0xff3e3e42,
  ); // Soft highlight for better UX

  static const Color transparent = Colors.transparent;
  static Color theme = Color(0xff672EBA);

  // Dynamic colors that change based on theme
  static Color get black {
    try {
      final themeController = Get.find<MbxThemeController>();
      return themeController.isDarkMode ? _darkBlack : _lightBlack;
    } catch (e) {
      return _lightBlack; // Fallback to light mode
    }
  }

  static Color get gray {
    try {
      final themeController = Get.find<MbxThemeController>();
      return themeController.isDarkMode ? _darkGray : _lightGray;
    } catch (e) {
      return _lightGray; // Fallback to light mode
    }
  }

  static Color get lightGray {
    try {
      final themeController = Get.find<MbxThemeController>();
      return themeController.isDarkMode ? _darkLightGray : _lightLightGray;
    } catch (e) {
      return _lightLightGray; // Fallback to light mode
    }
  }

  static Color get white {
    try {
      final themeController = Get.find<MbxThemeController>();
      return themeController.isDarkMode ? _darkWhite : _lightWhite;
    } catch (e) {
      return _lightWhite; // Fallback to light mode
    }
  }

  static Color get highlight {
    try {
      final themeController = Get.find<MbxThemeController>();
      return themeController.isDarkMode ? _darkHighlight : _lightHighlight;
    } catch (e) {
      return _lightHighlight; // Fallback to light mode
    }
  }

  // Surface colors for different elevation levels
  static Color get surface {
    try {
      final themeController = Get.find<MbxThemeController>();
      return themeController.isDarkMode ? Color(0xff202020) : Color(0xffffffff);
    } catch (e) {
      return Color(0xffffffff); // Fallback to light mode
    }
  }

  static Color get cardBackground {
    try {
      final themeController = Get.find<MbxThemeController>();
      return themeController.isDarkMode ? Color(0xff2a2a2a) : Color(0xffffffff);
    } catch (e) {
      return Color(0xffffffff); // Fallback to light mode
    }
  }
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(3, 9), radix: 16) + 0xFF000000);
}
