import 'package:mbankingflutter/news/models/mbx_news_model.dart';
import 'package:mbankingflutter/utils/mbx_apis.dart';

import '../../utils/all_utils.dart';

class MbxNewsListVM {
  static List<MbxNewsModel> list = [];

  static Future<ApiXResponse> request() {
    return MbxApi.post(
            endpoint: '/news/list',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxNewsListContract.json',
            contract: true)
        .then((resp) async {
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var movie = MbxNewsModel.fromJason(item);
          list.add(movie);
        }
      }
      return resp;
    });
  }
}
