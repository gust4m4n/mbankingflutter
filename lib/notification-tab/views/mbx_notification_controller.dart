import 'package:mbxflutter/notification-tab/viewmodels/mbx_notification_list_vm.dart';

import '../../widgets/all_widgets.dart';

class MbxNotificationController extends GetxController {
  final scrollController = ScrollController();
  var notificationListVM = MbxNotificationVM();

  @override
  void onReady() {
    super.onReady();
    nextPage();
  }

  btnBackClicked() {
    Get.back();
  }

  nextPage() {
    if (notificationListVM.loading) return;
    notificationListVM.nextPage().then((resp) {
      update();
    });
  }
}
