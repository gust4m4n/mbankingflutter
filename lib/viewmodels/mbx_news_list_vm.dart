import '../models/mbx_news_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

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
