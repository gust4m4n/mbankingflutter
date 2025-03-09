import 'dart:async';

import 'package:mbankingflutter/apis/mbx_apis.dart';
import 'package:mbankingflutter/login/models/mbx_onboarding_model.dart';

class MbxOnboardingListVM {
  var loading = false;
  List<MbxOnboardingModel> list = [];
  List<MbxOnboardingModel> filtered = [];

  clear() {
    list = [];
  }

  Future<ApiXResponse> nextPage() {
    loading = true;
    return MbxApi.post(
            endpoint: '/movies',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxOnboardingListContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var movie = MbxOnboardingModel.fromJason(item);
          list.add(movie);
        }
      }
      return resp;
    });
  }

  sort() {
    list.sort((a, b) => a.title.compareTo(b.title));
  }

  setFilter(String keyword) {
    filtered = [];
    for (var item in list) {
      if (keyword.isEmpty) {
        filtered.add(item);
      } else {
        if (item.title.toLowerCase().contains(keyword.toLowerCase())) {
          filtered.add(item);
        }
      }
    }
  }
}
