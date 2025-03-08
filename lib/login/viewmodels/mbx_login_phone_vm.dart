import 'dart:async';

import 'package:mbankingflutter/utils/api_x.dart';
import 'package:mbankingflutter/viewmodels/mbx_apis.dart';

class MbxLoginPhoneVM {
  static Future<ApiXResponse> request({required String phone}) {
    final params = {
      'phone': phone,
    };
    return MbxApi.post(
            endpoint: '/login/phone',
            params: params,
            headers: {},
            contractFile: 'assets/contracts/MbxLoginPhoneContract.json',
            contract: true)
        .then((resp) async {
      return resp;
    });
  }
}
