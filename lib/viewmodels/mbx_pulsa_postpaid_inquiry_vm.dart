import '../models/mbx_inquiry_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxPulsaPostpaidInquiryVM {
  var loading = false;
  var inquiry = MbxInquiryModel();

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
            endpoint: '/pulsa/postpaid/inquiry',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxPulsaPostpaidInquiryContract.json',
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