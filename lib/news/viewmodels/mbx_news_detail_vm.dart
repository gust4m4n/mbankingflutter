import 'package:mbxflutter/apis/mbx_apis.dart';
import 'package:mbxflutter/news/models/mbx_news_model.dart';

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
      contract: true,
    ).then((resp) async {
      loading = false;
      if (resp.status == 200) {
        news = MbxNewsModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
