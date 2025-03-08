import '../models/mbx_pulsa_prepaid_denom_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxPulsaPrepaidDenomsVM {
  List<MbxPulsaPrepaidDenomModel> list = [];

  Future<ApiXResponse> request({required String phone}) {
    return MbxApi.get(
            endpoint: '/pulsa/prepaid/denoms',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxPulsaPrepaidDenomsContract.json',
            contract: true)
        .then((resp) {
      if (resp.status == 200) {
        clear();
        for (var item in resp.jason['data'].jasonListValue) {
          list.add(MbxPulsaPrepaidDenomModel.fromJason(item));
        }
      }
      return resp;
    });
  }

  void clear() {
    list = [];
  }
}
