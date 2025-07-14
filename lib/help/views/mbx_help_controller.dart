import 'package:mbxflutter/login/models/mbx_account_model.dart';
import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';

import '../../widget-x/all_widgets.dart';

class MbxHelpController extends GetxController {
  List<MbxAccountModel> accounts = [];

  MbxHelpController() {
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
