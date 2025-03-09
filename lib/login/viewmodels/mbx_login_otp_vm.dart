import 'dart:async';

import 'package:mbankingflutter/apis/mbx_apis.dart';

class MbxLoginOtpVM {
  static Future<ApiXResponse> request(
      {required String phone, required String otp}) {
    final params = {
      'phone': phone,
      'otp': otp,
    };
    return MbxApi.post(
            endpoint: '/login/otp',
            params: params,
            headers: {},
            contractFile: 'assets/contracts/MbxLoginOtpContract.json',
            contract: true)
        .then((resp) async {
      return resp;
    });
  }
}
