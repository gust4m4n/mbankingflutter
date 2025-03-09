import 'dart:io';
import '../utils/all_utils.dart';
import '../widgets/all_widgets.dart';

class MbxAntiJailbreakVM {
  static var jailbroken = false;

  static check() async {
    if (!kIsWeb) {
      if (Platform.isAndroid || Platform.isIOS) {
        jailbroken = await FlutterJailbreakDetection.jailbroken;
        if (jailbroken == true) {
          block();
          return;
        }
      }
    }
  }

  static block() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
