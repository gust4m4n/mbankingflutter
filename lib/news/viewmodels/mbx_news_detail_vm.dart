import 'package:mbankingflutter/news/models/mbx_news_model.dart';
import 'package:mbankingflutter/utils/mbx_apis.dart';

import '../../utils/all_utils.dart';

class MbxNewsDetailVM {
  var loading = false;
  var news = MbxNewsModel();

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
            endpoint: '/news/detail',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxNewsDetailContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        news = MbxNewsModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
