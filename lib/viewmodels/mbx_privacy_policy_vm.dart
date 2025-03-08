import '../models/mbx_privacy_policy_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxPrivacyPolicyVM {
  var loading = false;
  var privacy_policy = MbxPrivacyPolicyModel();

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
            endpoint: '/privacy-policy',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxPrivacyPolicyContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        privacy_policy = MbxPrivacyPolicyModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
