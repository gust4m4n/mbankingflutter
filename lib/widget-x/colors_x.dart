import 'package:flutter/material.dart';

class ColorX {
  static const Color blue = Color(0xff007bff);
  static const Color teal = Color(0xff17a2b8);
  static const Color green = Color(0xff28a745);
  static const Color yellow = Color(0xffffc107);
  static const Color red = Color(0xffdc3545);
  static const Color black = Color(0xff343a40);
  static const Color gray = Color(0xff6c757d);
  static const Color lightGray = Color(0xffd3d3d3);
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color highlight = Color(0xffE3E3E3);
  static Color theme = Color(0xff672EBA);
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(3, 9), radix: 16) + 0xFF000000);
}
