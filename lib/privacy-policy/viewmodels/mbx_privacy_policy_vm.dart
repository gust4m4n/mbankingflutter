import 'package:mbxflutter/apis/mbx_apis.dart';
import 'package:mbxflutter/privacy-policy/models/mbx_privacy_policy_model.dart';

class MbxPrivacyPolicyVM {
  var loading = false;
  var privacyPolicy = MbxPrivacyPolicyModel();

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
      endpoint: '/privacy-policy',
      params: {},
      headers: {},
      contractFile: 'assets/contracts/MbxPrivacyPolicyContract.json',
      contract: true,
    ).then((resp) async {
      loading = false;
      if (resp.status == 200) {
        privacyPolicy = MbxPrivacyPolicyModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
