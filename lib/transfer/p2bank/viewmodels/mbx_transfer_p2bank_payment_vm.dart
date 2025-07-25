import 'package:mbxflutter/apis/mbx_apis.dart';
import 'package:mbxflutter/receipt/models/mbx_receipt_model.dart';

class MbxTransferP2BankPaymentVM {
  var receipt = MbxReceiptModel();

  Future<ApiXResponse> request({
    required String transactionId,
    required String pin,
    required bool biometric,
  }) {
    return MbxApi.post(
      endpoint: '/transfer/p2bank/payment',
      params: {},
      headers: {},
      contractFile: 'assets/contracts/MbxTransferP2BankPaymentContract.json',
      contract: true,
    ).then((resp) {
      if (resp.status == 200) {
        receipt = MbxReceiptModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
