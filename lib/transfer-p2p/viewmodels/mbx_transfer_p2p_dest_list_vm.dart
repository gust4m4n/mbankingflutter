import 'package:mbankingflutter/transfer-p2p/models/mbx_transfer_p2p_dest_model.dart';
import 'package:mbankingflutter/utils/mbx_apis.dart';

import '../../utils/all_utils.dart';

class MbxTransferP2PDestListVM {
  var loading = false;
  List<MbxTransferP2PDestModel> list = [];
  List<MbxTransferP2PDestModel> filtered = [];

  clear() {
    list = [];
  }

  Future<ApiXResponse> nextPage() {
    loading = true;
    return MbxApi.post(
            endpoint: '/transfer/p2p/dest',
            params: {},
            headers: {},
            contractFile:
                'assets/contracts/MbxTransferP2PDestListContract.json',
            contract: true)
        .then((resp) {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var dest = MbxTransferP2PDestModel.fromJason(item);
          list.add(dest);
        }
      }
      return resp;
    });
  }

  sort() {
    list.sort((a, b) => a.name.compareTo(b.name));
  }

  setFilter(String keyword) {
    filtered = [];
    for (var item in list) {
      if (keyword.isEmpty) {
        filtered.add(item);
      } else {
        if (item.name.toLowerCase().contains(keyword.toLowerCase()) ||
            item.account.toLowerCase().contains(keyword.toLowerCase())) {
          filtered.add(item);
        }
      }
    }
  }
}
