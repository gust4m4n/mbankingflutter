import 'package:mbxflutter/apis/mbx_apis.dart';
import 'package:mbxflutter/inquiry/models/mbx_inquiry_model.dart';

class MbxCardlessInquiryVM {
  var loading = false;
  var inquiry = MbxInquiryModel();

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
      endpoint: '/cardless/inquiry',
      params: {},
      headers: {},
      contractFile: 'assets/contracts/MbxCardlessInquiryContract.json',
      contract: true,
    ).then((resp) {
      loading = false;
      if (resp.status == 200) {
        inquiry = MbxInquiryModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
