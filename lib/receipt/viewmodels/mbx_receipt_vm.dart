import 'package:mbxflutter/apis/mbx_apis.dart';
import 'package:mbxflutter/receipt/models/mbx_receipt_model.dart';

class MbxReceiptVM {
  var loading = false;
  var receipt = MbxReceiptModel();

  Future<ApiXResponse> request({required String transaction_i}) {
    loading = true;
    final params = {'transaction_i': transaction_i};
    return MbxApi.post(
      endpoint: '/receipt',
      params: params,
      headers: {},
      contractFile: 'assets/contracts/MbxReceiptContract.json',
      contract: true,
    ).then((resp) async {
      loading = false;
      if (resp.status == 200) {
        receipt = MbxReceiptModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
