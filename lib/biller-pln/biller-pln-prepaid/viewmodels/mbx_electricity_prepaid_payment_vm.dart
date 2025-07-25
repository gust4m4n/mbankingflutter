import 'package:mbxflutter/apis/mbx_apis.dart';
import 'package:mbxflutter/receipt/models/mbx_receipt_model.dart';

class MbxElectricityPrepaidPaymentVM {
  var receipt = MbxReceiptModel();

  Future<ApiXResponse> request({
    required String transactionId,
    required String pin,
    required bool biometric,
  }) {
    return MbxApi.post(
      endpoint: '/electricity/prepaid/payment',
      params: {},
      headers: {},
      contractFile:
          'assets/contracts/MbxElectricityPrepaidPaymentContract.json',
      contract: true,
    ).then((resp) {
      if (resp.status == 200) {
        receipt = MbxReceiptModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
