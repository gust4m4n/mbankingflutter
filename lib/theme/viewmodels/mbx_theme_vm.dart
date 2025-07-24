import 'package:mbxflutter/preferences/mbx_preferences_vm_users.dart';
import 'package:mbxflutter/theme/views/mbx_theme_sheet.dart';
import 'package:mbxflutter/widget-x/all_widgets.dart';

class MbxThemeVM {
  static List<Color> colors = [
    Color(0xff1057da),
    Color(0xff184421),
    Color(0xff1877F2),
    Color(0xff1b174d),
    Color(0xff2196f3),
    Color(0xff3bb4a9),
    Color(0xff3c3c3d),
    Color(0xff3f51b5),
    Color(0xff45669e),
    Color(0xff4CA735),
    Color(0xff4f89b7),
    Color(0xff528760),
    Color(0xff646d74),
    Color(0xff673ab7),
    Color(0xff76110e),
    Color(0xff7a5249),
    Color(0xff9268ca),
    Color(0xff9b4668),
    Color(0xff9c27b0),
    Color(0xffdf5e3a),
    Color(0xffe20030),
    Color(0xffe81e63),
    Color(0xfffe403f),
    Color(0xffff5416),
    Color(0xffff9800),
  ];

  static Future<bool> change<T>() async {
    final sheet = MbxThemeSheet();
    final value = await sheet.show();
    if (value == null) return false;
    await MbxUserPreferencesVM.setTheme(value);
    ColorX.theme = hexToColor(value);
    return true;
  }
}
