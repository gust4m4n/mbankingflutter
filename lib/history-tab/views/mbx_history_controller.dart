import 'package:mbankingflutter/history-tab/viewmodels/mbx_history_list_vm.dart';

import '../../widgets/all_widgets.dart';

class MbxHistoryController extends GetxController {
  final scrollController = ScrollController();
  var historyListVM = MbxHistoryListVM();

  @override
  void onReady() {
    super.onReady();
    nextPage();
  }

  btnBackClicked() {
    Get.back();
  }

  nextPage() {
    update();
    historyListVM.nextPage().then((resp) {
      update();
    });
  }
}
