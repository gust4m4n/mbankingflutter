import 'all_widgets.dart';

class StatusBarX {
  static var theme = SystemUiOverlayStyle.light;
  static setLight() {
    StatusBarX.theme = const SystemUiOverlayStyle(
        statusBarColor: ColorX.transparent,
        systemNavigationBarColor: ColorX.white,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(theme);
  }

  static setDark() {
    StatusBarX.theme = const SystemUiOverlayStyle(
        statusBarColor: ColorX.transparent,
        systemNavigationBarColor: ColorX.white,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(theme);
  }
}
