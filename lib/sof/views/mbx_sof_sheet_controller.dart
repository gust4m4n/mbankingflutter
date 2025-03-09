import 'package:mbankingflutter/login/viewmodels/mbx_profile_vm.dart';

import '../../../models/mbx_account_model.dart';
import '../../../widgets/all_widgets.dart';

class MbxSofSheetController extends GetxController {
  List<MbxAccountModel> accounts = [];

  MbxSofSheetController() {
    for (var item in MbxProfileVM.profile.accounts) {
      if (item.sof) {
        item.visible = false;
        accounts.add(item);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  btnCloseClicked() {
    Get.back();
  }

  btnEyeClicked(int index) {
    accounts[index].visible = !accounts[index].visible;
    update();
  }
}
