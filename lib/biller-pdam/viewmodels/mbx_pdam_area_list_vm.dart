import 'package:mbankingflutter/apis/mbx_apis.dart';

import '../models/mbx_pdam_area_model.dart';

class MbxPDAMAreaListVM {
  List<MbxPDAMAreaModel> list = [];

  Future<ApiXResponse> request() {
    return MbxApi.post(
            endpoint: '/pdam/area/list',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxPDAMAreaListContract.json',
            contract: true)
        .then((resp) {
      list = [];
      if (resp.status == 200) {
        for (final item in resp.jason['data'].jasonListValue) {
          list.add(MbxPDAMAreaModel.fromJason(item));
        }
      }
      return resp;
    });
  }
}
