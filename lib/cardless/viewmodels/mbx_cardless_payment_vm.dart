import 'package:mbxflutter/apis/mbx_apis.dart';
import 'package:mbxflutter/cardless/models/mbx_cardless_step_model.dart';

class MbxCardlessPaymentVM {
  List<MbxCardlessStepModel> steps = [];

  Future<ApiXResponse> request({
    required String transactionId,
    required String pin,
    required bool biometric,
  }) {
    return MbxApi.post(
      endpoint: '/cardless/payment',
      params: {},
      headers: {},
      contractFile: 'assets/contracts/MbxCardlessPaymentContract.json',
      contract: true,
    ).then((resp) {
      if (resp.status == 200) {
        steps = [];
        for (var item in resp.jason['data']['steps'].jasonListValue) {
          steps.add(MbxCardlessStepModel.fromJason(item));
        }
      }
      return resp;
    });
  }
}
