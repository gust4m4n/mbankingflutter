import 'package:mbxflutter/apis/mbx_apis.dart';
import 'package:mbxflutter/transfer/p2bank/models/mbx_transfer_p2bank_dest_model.dart';

class MbxTransferP2BankDestListVM {
  var loading = false;
  List<MbxTransferP2BankDestModel> list = [];
  List<MbxTransferP2BankDestModel> filtered = [];

  clear() {
    list = [];
  }

  Future<ApiXResponse> nextPage() {
    loading = true;
    return MbxApi.post(
      endpoint: '/transfer/p2bank/dest',
      params: {},
      headers: {},
      contractFile: 'assets/contracts/MbxTransferP2BankDestListContract.json',
      contract: true,
    ).then((resp) {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var dest = MbxTransferP2BankDestModel.fromJason(item);
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
