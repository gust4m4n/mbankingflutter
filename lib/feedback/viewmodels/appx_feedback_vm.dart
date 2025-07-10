import 'dart:async';

import 'package:mbxflutter/apis/mbx_apis.dart';

class AppxFeedbackScore {
  static final int notGiven = -1;
  static final int notYet = 0;
  static final int verySatisfied = 1;
  static final int satisfied = 2;
  static final int normal = 3;
  static final int bad = 4;
  static final int veryBad = 5;
}

class AppxFeedbackVM {
  static Future<AppxFeedbackGetResponse> get({required String feature}) {
    return MbxApi.get(
      endpoint: '/feedback?feature_name=$feature',
      params: {},
      headers: {},
      contractFile: '',
      contract: false,
    ).then((resp) async {
      return AppxFeedbackGetResponse.fromResponse(resp);
    });
  }

  static Future<ApiXResponse> update({
    required String feature,
    required int score,
  }) {
    final params = {'feature_name': feature, 'score': score.toString()};
    return MbxApi.post(
      endpoint: '/feedback',
      params: params,
      headers: {},
      contractFile: '',
      contract: false,
    ).then((resp) async {
      return resp;
    });
  }
}

class AppxFeedbackGetResponse extends ApiXResponse {
  int score = AppxFeedbackScore.notYet;
  AppxFeedbackGetResponse.fromResponse(ApiXResponse resp) {
    //copyFrom(resp);
    score = resp.jason['data'].intValue;
  }
}
