import 'package:mbxflutter/biller-pln/sheet/views/mbx_electricity_picker.dart';
import 'package:mbxflutter/biller-pulsa/sheet/views/mbx_pulsa_picker.dart';
import 'package:mbxflutter/home-tab/viewmodels/mbx_foreign_exchange_list_vm.dart';
import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbxflutter/news/viewmodels/mbx_news_list_vm.dart';
import 'package:mbxflutter/theme/viewmodels/mbx_theme_vm.dart';

import '../../widgets/all_widgets.dart';

class MbxHomeController extends GetxController {
  final scrollController = ScrollController();
  final foreignExchangeListVM = MbxForeignExchangeListVM();

  @override
  void onReady() {
    super.onReady();
    MbxNewsListVM.request().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });

    foreignExchangeListVM.request().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });
  }

  btnThemeClicked() {
    MbxThemeVM.change().then((value) {
      if (value) {
        Get.offAllNamed('/home');
      }
    });
  }

  btnLockClicked() {
    Get.toNamed('/relogin', arguments: {'autologin': false});
  }

  btnEyeClicked(int index) {
    MbxProfileVM.profile.accounts[index].visible =
        !MbxProfileVM.profile.accounts[index].visible;
    update();
  }

  btnBackClicked() {
    Get.back();
  }

  btnTransferClicked() {
    Get.toNamed('/transfer');
  }

  btnCardlessClicked() {
    Get.toNamed('/cardless');
  }

  btnElectricityClicked() async {
    final picker = MbxElectricityPicker();
    await picker.show();
  }

  btnQRISClicked() {
    Get.toNamed('/qris');
  }

  btnPulsaClicked() async {
    final picker = MbxPulsaPicker();
    await picker.show();
  }

  btnPBBClicked() async {
    Get.toNamed('/pbb');
  }

  btnPDAMClicked() async {
    Get.toNamed('/pdam');
  }
}
