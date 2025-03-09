import 'package:mbankingflutter/apis/mbx_apis.dart';
import 'package:mbankingflutter/inquiry/models/mbx_inquiry_model.dart';

class MbxPBBInquiryVM {
  var loading = false;
  var inquiry = MbxInquiryModel();

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
            endpoint: '/pbb/inquiry',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxPBBInquiryContract.json',
            contract: true)
        .then((resp) {
      loading = false;
      if (resp.status == 200) {
        inquiry = MbxInquiryModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
