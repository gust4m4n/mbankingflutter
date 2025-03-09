import 'package:mbankingflutter/home-tab/models/mbx_foreign_exchange_model.dart';
import 'package:mbankingflutter/utils/mbx_apis.dart';

import '../../utils/all_utils.dart';

class MbxForeignExchangeListVM {
  var loading = false;
  List<MbxForeignExchangeModel> list = [];

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
            endpoint: '/foreign-exchange/list',
            params: {},
            headers: {},
            contractFile:
                'assets/contracts/MbxForeignExchangeListContract.json',
            contract: true)
        .then((resp) {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          list.add(MbxForeignExchangeModel.fromJason(item));
        }
      }
      return resp;
    });
  }
}
