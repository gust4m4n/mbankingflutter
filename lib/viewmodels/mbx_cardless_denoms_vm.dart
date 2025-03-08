import '../models/mbx_cardless_denom_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxCardlessDenomsVM {
  List<MbxCardlessDenomModel> list = [];

  Future<ApiXResponse> request() {
    return MbxApi.get(
            endpoint: '/cardless/denoms',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxCardlessDenomsContract.json',
            contract: true)
        .then((resp) {
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
