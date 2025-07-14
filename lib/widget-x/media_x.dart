import 'all_widgets.dart';

class MediaX {
  static double get width =>
      kIsWeb ? 400.0 : MediaQuery.of(Get.context!).size.width;
  static double get height => MediaQuery.of(Get.context!).size.height;
}
