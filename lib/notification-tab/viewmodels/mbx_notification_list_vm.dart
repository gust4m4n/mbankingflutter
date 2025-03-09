import 'package:mbankingflutter/apis/mbx_apis.dart';
import 'package:mbankingflutter/notification-tab/models/mbx_notification_model.dart';

class MbxNotificationVM {
  var loading = false;
  List<MbxNotificationModel> list = [];

  clear() {
    list = [];
  }

  Future<ApiXResponse> nextPage() {
    loading = true;
    return MbxApi.post(
            endpoint: '/notification',
            params: {},
            headers: {},
            contractFile: 'assets/contracts/MbxNotificationListContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var history = MbxNotificationModel(item);
          list.add(history);
        }
      }
      return resp;
    });
  }
}
