import 'dart:async';
import '../widget-x/all_widgets.dart';

class MbxBiometricVM {
  static Future<bool> available() async {
    final LocalAuthentication auth = LocalAuthentication();
    final supported = await auth.isDeviceSupported();
    if (!supported) {
      return false;
    }
    final enrolled = await auth.getAvailableBiometrics();
    return enrolled.isNotEmpty;
  }

  static Future<bool> authenticate() async {
    final LocalAuthentication auth = LocalAuthentication();
    try {
      final bool authenticated = await auth.authenticate(
          localizedReason: 'Biometric',
          options: const AuthenticationOptions(biometricOnly: true));
      return authenticated;
    } on PlatformException {
      // Try again later
      return false;
    }
  }
}
