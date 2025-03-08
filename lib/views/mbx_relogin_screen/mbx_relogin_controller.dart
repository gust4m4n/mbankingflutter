import 'package:mbankingflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbankingflutter/theme-sheet/viewmodels/mbx_theme_vm.dart';

import '../../pin-sheet/views/mbx_pin_sheet.dart';
import '../../utils/all_utils.dart';
import '../../viewmodels/mbx_logout_vm.dart';
import '../../viewmodels/mbx_relogin_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_help_sheet/mbx_help_sheet.dart';

class MbxReloginController extends GetxController {
  var version = '';

  @override
  void onReady() {
    super.onReady();
    PackageInfo.fromPlatform().then((info) {
      version = 'Version ${info.version}';
      update();
    });
    MbxProfileVM.request().then((resp) {
      update();
    });
    final autologin = Get.arguments?['autologin'];
    if (autologin == null || (autologin as bool) == true) {
      btnLoginClicked();
    }
  }

  btnThemeClicked() {
    MbxThemeVM.change().then((value) {
      if (value) {
        Get.offAllNamed('/relogin', arguments: {'autologin': false});
      }
    });
  }

  btnLoginClicked() {
    final pinSheet = MbxPinSheet();
    pinSheet.show(
      title: 'PIN',
      message: 'Masukkan nomor pin m-banking atau ATM anda.',
      secure: true,
      biometric: true,
      onSubmit: (code, biometric) async {
        LoggerX.log('[PIN] entered: $code biometric; $biometric');
        Get.loading();
        final resp =
            await MbxReloginVM.request(pin: code, biometric: biometric);
        if (resp.status == 200) {
          LoggerX.log('[PIN] verfied: $code');
          MbxProfileVM.request().then((resp) {
            Get.offAllNamed('/home');
          });
        } else {
          Get.back();
          pinSheet.clear(resp.message);
        }
      },
      optionTitle: 'Lupa PIN',
      optionClicked: () {
        pinSheet.clear('');
        ToastX.showSuccess(msg: 'PIN akan direset, silahkan hubungi CS kami.');
      },
    );
  }

  btnQRISClicked() {
    final pinSheet = MbxPinSheet();
    pinSheet.show(
      title: 'PIN',
      message: 'Masukkan nomor pin m-banking atau ATM anda.',
      secure: true,
      biometric: true,
      onSubmit: (code, biometric) async {
        LoggerX.log('[PIN] entered: $code biometric; $biometric');
        Get.loading();
        final resp =
            await MbxReloginVM.request(pin: code, biometric: biometric);
        Get.back();
        if (resp.status == 200) {
          Get.back();
          LoggerX.log('[PIN] verfied: $code');
          MbxProfileVM.request().then((resp) {
            Get.toNamed('/qris');
          });
        } else {
          pinSheet.clear(resp.message);
        }
      },
      optionTitle: 'Lupa PIN',
      optionClicked: () {
        pinSheet.clear('');
        ToastX.showSuccess(msg: 'PIN akan direset, silahkan hubungi CS kami.');
      },
    );
  }

  btnCardlessClicked() {
    final pinSheet = MbxPinSheet();
    pinSheet.show(
      title: 'PIN',
      message: 'Masukkan nomor pin m-banking atau ATM anda.',
      secure: true,
      biometric: true,
      onSubmit: (code, biometric) async {
        LoggerX.log('[PIN] entered: $code biometric; $biometric');
        Get.loading();
        final resp =
            await MbxReloginVM.request(pin: code, biometric: biometric);
        if (resp.status == 200) {
          LoggerX.log('[PIN] verfied: $code');
          MbxProfileVM.request().then((resp) {
            Get.toNamed('/cardless');
          });
        } else {
          Get.back();
          pinSheet.clear(resp.message);
        }
      },
      optionTitle: 'Lupa PIN',
      optionClicked: () {
        pinSheet.clear('');
        ToastX.showSuccess(msg: 'PIN akan direset, silahkan hubungi CS kami.');
      },
    );
  }

  btnHelpClicked() {
    MbxHelpSheet.show().then((sof) {
      if (sof != null) {}
    });
  }

  btnSwitchAccountClicked() {
    SheetX.showMessage(
        title: 'Keluar',
        message: 'Apakah anda yakin ?',
        leftBtnTitle: 'Ya',
        onLeftBtnClicked: () {
          Get.loading();
          MbxLogoutVM.request().then((resp) {
            Get.back();
            MbxProfileVM.logout();
          });
        },
        rightBtnTitle: 'Tidak',
        onRightBtnClicked: () {
          Get.back();
        });
  }
}
