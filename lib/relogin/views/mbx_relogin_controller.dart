import 'package:mbxflutter/help/views/mbx_help_sheet.dart';
import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbxflutter/pin/views/mbx_pin_sheet.dart';
import 'package:mbxflutter/profile-tab/mbx_logout_vm.dart';
import 'package:mbxflutter/relogin/viewmodels/mbx_relogin_vm.dart';
import 'package:mbxflutter/theme/viewmodels/mbx_theme_vm.dart';

import '../../utils/all_utils.dart';
import '../../widget-x/all_widgets.dart';

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
      message: 'enter_pin_message'.tr,
      secure: true,
      biometric: true,
      onSubmit: (code, biometric) async {
        LoggerX.log('[PIN] entered: $code biometric; $biometric');
        Get.loading();
        final resp = await MbxReloginVM.request(
          pin: code,
          biometric: biometric,
        );
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
      optionTitle: 'forgot_pin'.tr,
      optionClicked: () {
        pinSheet.clear('');
        ToastX.showSuccess(msg: 'pin_reset_message'.tr);
      },
    );
  }

  btnQRISClicked() {
    final pinSheet = MbxPinSheet();
    pinSheet.show(
      title: 'PIN',
      message: 'enter_pin_message'.tr,
      secure: true,
      biometric: true,
      onSubmit: (code, biometric) async {
        LoggerX.log('[PIN] entered: $code biometric; $biometric');
        Get.loading();
        final resp = await MbxReloginVM.request(
          pin: code,
          biometric: biometric,
        );
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
      optionTitle: 'forgot_pin'.tr,
      optionClicked: () {
        pinSheet.clear('');
        ToastX.showSuccess(msg: 'pin_reset_message'.tr);
      },
    );
  }

  btnCardlessClicked() {
    final pinSheet = MbxPinSheet();
    pinSheet.show(
      title: 'PIN',
      message: 'enter_pin_message'.tr,
      secure: true,
      biometric: true,
      onSubmit: (code, biometric) async {
        LoggerX.log('[PIN] entered: $code biometric; $biometric');
        Get.loading();
        final resp = await MbxReloginVM.request(
          pin: code,
          biometric: biometric,
        );
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
      optionTitle: 'forgot_pin'.tr,
      optionClicked: () {
        pinSheet.clear('');
        ToastX.showSuccess(msg: 'pin_reset_message'.tr);
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
      },
    );
  }
}
