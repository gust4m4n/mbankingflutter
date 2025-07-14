import 'dart:io';

import '../widget-x/all_widgets.dart';

class MbxAntiJailbreakVM {
  static var jailbroken = false;

  static check() async {}

  static block() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
