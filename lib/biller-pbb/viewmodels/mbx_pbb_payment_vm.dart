import 'package:mbankingflutter/receipt/models/mbx_receipt_model.dart';
import 'package:mbankingflutter/utils/mbx_apis.dart';

import '../../utils/all_utils.dart';

class MbxPBBPaymentVM {
  var receipt = MbxReceiptModel();

  Future<ApiXResponse> request(
      {required String transaction_id,
      required String pin,
      required bool biometric}) {
    return MbxApi.post(
            endpoint: '/pbb/payment',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxPBBPaymentContract.json',
            contract: true)
        .then((resp) {
      if (resp.status == 200) {
        receipt = MbxReceiptModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
