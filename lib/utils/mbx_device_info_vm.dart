import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:mbankingflutter/widgets/all_widgets.dart';

class MbxDeviceInfoVM {
  static var simulator = false;
  static Future<void> request() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (kIsWeb == true) {
        //WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      } else {
        if (Platform.isAndroid) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          simulator = !androidInfo.isPhysicalDevice;
        }
        if (Platform.isIOS) {
          IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          simulator = !iosInfo.isPhysicalDevice;
        }
      }
    } catch (e) {}
  }
}
