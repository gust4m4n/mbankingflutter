import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../utils/logger_x.dart';

class ReachabilityX {
  static bool internetConnected = true;
  static late StreamSubscription<List<ConnectivityResult>> subscription;

  static Future<bool> checkInternetConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      internetConnected = true;
    } else {
      internetConnected = false;
    }
    LoggerX.log('[REACHABILITY] internetConnected: $internetConnected');
    return internetConnected;
  }

  static Future<void> startListening({
    required Function(bool connected)? handler,
  }) async {
    await checkInternetConnectivity();

    subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      var connected = true;
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        connected = true;
      } else {
        connected = false;
      }
      if (internetConnected != connected) {
        internetConnected = connected;
        LoggerX.log('[REACHABILITY] internetConnected: $internetConnected');
        if (handler != null) {
          handler(internetConnected);
        }
      }
    });
  }

  static Future<void> stopListening() async {
    await subscription.cancel();
  }
}
