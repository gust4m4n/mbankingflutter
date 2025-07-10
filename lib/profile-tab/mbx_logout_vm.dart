import 'dart:async';

import 'package:mbxflutter/apis/mbx_apis.dart';

class MbxLogoutVM {
  static Future<ApiXResponse> request() {
    return MbxApi.post(
      endpoint: '/logout',
      params: {},
      headers: {},
      contractFile: 'assets/contracts/MbxLogoutContract.json',
      contract: true,
    ).then((resp) async {
      return resp;
    });
  }
}
