import 'package:mbxflutter/apis/mbx_apis.dart';

import '../../../cardless/models/mbx_cardless_denom_model.dart';

class MbxElectricityPrepaidDenomsVM {
  List<MbxCardlessDenomModel> list = [];

  Future<ApiXResponse> request() {
    return MbxApi.get(
      endpoint: '/electricity/prepaid/denoms',
      params: {},
      headers: {},
      contractFile: 'assets/contracts/MbxElectricityPrepaidDenomsContract.json',
      contract: true,
    ).then((resp) {
      if (resp.status == 200) {
        list = [];
        for (var item in resp.jason['data'].jasonListValue) {
          list.add(MbxCardlessDenomModel.fromJason(item));
        }
      }
      return resp;
    });
  }
}
