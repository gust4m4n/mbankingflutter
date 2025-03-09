import 'package:mbankingflutter/transfer/main/viewmodels/mbx_transfer_history_model.dart';
import 'package:mbankingflutter/utils/mbx_apis.dart';

import '../../../utils/all_utils.dart';

class MbxTransferHistoryListVM {
  var loading = false;
  List<MbxTransferHistoryModel> list = [];

  Future<ApiXResponse> nextPage() {
    loading = true;
    return MbxApi.post(
            endpoint: '/transfer/history',
            params: {},
            headers: {},
            contractFile:
                'assets/contracts/MbxTransferHistoryListContract.json',
            contract: true)
        .then((resp) {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var history = MbxTransferHistoryModel.fromJason(item);
          list.add(history);
        }
      }
      return resp;
    });
  }
}
