import 'package:mbankingflutter/models/mbx_transfer_p2bank_service_model.dart';

import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxTransferP2BankServiceListVM {
  var loading = false;
  List<MbxTransferP2BankServiceModel> list = [];

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
            endpoint: '/transfer/p2bank/service/list',
            params: {},
            headers: {},
            contractFile:
                'assets/contracts/MbxTransferP2BankServiceListContract.json',
            contract: true)
        .then((resp) {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          final service = MbxTransferP2BankServiceModel.fromJason(item);
          list.add(service);
        }
      }
      return resp;
    });
  }
}
