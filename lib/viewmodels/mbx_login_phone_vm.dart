import 'dart:async';

import '../utils/all_utils.dart';
import 'mbx_apis.dart';

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
