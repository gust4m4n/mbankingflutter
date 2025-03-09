import 'dart:async';

import 'package:client_information/client_information.dart';
import 'package:mbankingflutter/utils/mbx_preferences_vm+users.dart';
import 'package:uuid/uuid.dart';

class MbxDeviceVM {
  static Future<String> deviceId() async {
    var id = await MbxUserPreferencesVM.getDeviceId();
    if (id.isEmpty) {
      id = await ClientInformation.fetch().then((info) => info.deviceId);
      id = id + Uuid().v4();
      id = id.replaceAll(' ', '');
      id = id.replaceAll('-', '');
      id = id.toLowerCase();
      await MbxUserPreferencesVM.setDeviceId(id);
    }
    return id;
  }

  static Future<String> deviceName() async {
    ClientInformation info = await ClientInformation.fetch();
    return info.deviceName;
  }

  static Future<String> deviceOSName() async {
    ClientInformation info = await ClientInformation.fetch();
    return info.osName;
  }

  static Future<String> deviceOSVersion() async {
    ClientInformation info = await ClientInformation.fetch();
    return info.osVersion;
  }

  static Future<String> deviceOSVersionCode() async {
    ClientInformation info = await ClientInformation.fetch();
    return '${info.osVersionCode}';
  }
}
