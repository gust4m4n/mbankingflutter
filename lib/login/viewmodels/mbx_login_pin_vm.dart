import 'dart:async';

import 'package:mbankingflutter/utils/api_x.dart';
import 'package:mbankingflutter/viewmodels/mbx_apis.dart';
import 'package:mbankingflutter/viewmodels/mbx_preferences_vm+users.dart';

class MbxLoginPinVM {
  static Future<ApiXResponse> request(
      {required String phone, required String otp, required String pin}) {
    final params = {
      'phone': phone,
      'otp': otp,
      'pin': pin,
    };
    return MbxApi.post(
            endpoint: '/login/pin',
            params: params,
            headers: {},
            contractFile: 'assets/contracts/MbxLoginPinContract.json',
            contract: true)
        .then((resp) async {
      if (resp.status == 200) {
        MbxUserPreferencesVM.setToken(resp.jason['data']['token'].stringValue);
      } else {}
      return resp;
    });
  }
}
