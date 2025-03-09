import 'dart:async';

import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxSetBiometricVM {
  static Future<ApiXResponse> request(
      {required String pin, required bool biometric}) {
    final params = {'pin': pin, 'biometric': biometric};
    return MbxApi.post(
            endpoint: '/biometric/set',
            params: params,
            headers: {},
            contractFile: 'assets/contracts/MbxSetBiometricContract.json',
            contract: true)
        .then((resp) async {
      return resp;
    });
  }
}
