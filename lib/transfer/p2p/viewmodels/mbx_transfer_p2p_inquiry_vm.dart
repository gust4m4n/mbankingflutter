import 'package:mbankingflutter/inquiry/models/mbx_inquiry_model.dart';
import 'package:mbankingflutter/utils/mbx_apis.dart';

import '../../../utils/all_utils.dart';

class MbxTransferP2PInquiryVM {
  var loading = false;
  var inquiry = MbxInquiryModel();

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
            endpoint: '/transfer/p2p/inquiry',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxTransferP2PInquiryContract.json',
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
