import 'package:mbxflutter/avatar/views/mbx_avatar_sheet.dart';
import 'package:mbxflutter/help/views/mbx_help_sheet.dart';
import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbxflutter/pin/views/mbx_pin_sheet.dart';
import 'package:mbxflutter/preferences/mbx_preferences_vm+users.dart';
import 'package:mbxflutter/profile-tab/mbx_change_pin_vm.dart';
import 'package:mbxflutter/profile-tab/mbx_logout_vm.dart';
import 'package:mbxflutter/profile-tab/mbx_set_biometric_vm.dart';

import '../../utils/all_utils.dart';
import '../../widget-x/all_widgets.dart';

class MbxProfileController extends GetxController {
  var biometricEnabled = false;
  var version = '';

  @override
  Future<void> onReady() async {
    super.onReady();
    final info = await PackageInfo.fromPlatform();
    version = 'Version ${info.version}';
    await MbxProfileVM.request();
    biometricEnabled = await MbxUserPreferencesVM.getBiometricEnabled();
    update();
  }

  toggleBiometric(bool value) async {
    update();
    final pinSheet = MbxPinSheet();
    pinSheet
        .show(
          title: 'PIN',
          message: 'Masukkan nomor pin m-banking atau ATM anda.',
          secure: true,
          biometric: false,
          onSubmit: (code, biometric) async {
            Get.loading();
            MbxSetBiometricVM.request(pin: code, biometric: biometric).then((
              resp,
            ) async {
              Get.back();
              await MbxUserPreferencesVM.setBiometricEnabled(value);
              MbxProfileVM.profile.biometric = value;
              update();
              Get.back();
            });
          },
          optionTitle: 'Lupa PIN',
          optionClicked: () {
            pinSheet.clear('');
            ToastX.showSuccess(
              msg: 'PIN akan direset, silahkan hubungi CS kami.',
            );
          },
        )
        .then((value) async {
          biometricEnabled = await MbxUserPreferencesVM.getBiometricEnabled();
          update();
        });
  }

  btnChangePinClicked() {
    final pinSheet = MbxPinSheet();
    pinSheet
        .show(
          title: 'PIN',
          message: 'Masukkan nomor pin m-banking atau ATM anda.',
          secure: true,
          biometric: false,
          onSubmit: (code, biometric) async {
            Get.loading();
            Future.delayed(const Duration(milliseconds: 500), () {
              Get.back();
              Get.back();
              changePinNew();
            });
          },
          optionTitle: 'Lupa PIN',
          optionClicked: () {},
        )
        .then((value) async {});
  }

  changePinNew() {
    final pinSheet = MbxPinSheet();
    pinSheet
        .show(
          title: 'PIN Baru',
          message: 'Masukkan nomor pin m-banking atau ATM anda yang baru.',
          secure: true,
          biometric: false,
          onSubmit: (code, biometric) async {
            Get.loading();
            Future.delayed(const Duration(milliseconds: 500), () {
              Get.back();
              Get.back();
              changePinConfirm();
            });
          },
          optionTitle: '',
          optionClicked: () {},
        )
        .then((value) async {});
  }

  changePinConfirm() {
    final pinSheet = MbxPinSheet();
    pinSheet
        .show(
          title: 'Konfirmasi PIN Baru',
          message:
              'Masukkan ulang nomor pin m-banking atau ATM anda yang baru.',
          secure: true,
          biometric: false,
          onSubmit: (code, biometric) async {
            Get.loading();
            MbxChangePinVM.request(pin: code, newPin: code).then((resp) async {
              Get.back();
              Get.back();
              changePinSuccess();
            });
          },
          optionTitle: '',
          optionClicked: () {},
        )
        .then((value) async {});
  }

  changePinSuccess() {
    SheetX.showMessage(
      icon: ImageX(
        faIcon: FontAwesomeIcons.check,
        color: ColorX.white,
        width: 60.0,
        height: 60.0,
        cornerRadius: 30.0,
        backgroundColor: ColorX.green,
        padding: EdgeInsets.all(12.0),
      ),
      title: 'Ganti PIN',
      message:
          'PIN telah berhasil diganti, silahkan gunakan PIN yang baru untuk seterusnya.',
      leftBtnTitle: 'OK',
      onLeftBtnClicked: () {
        Get.back();
      },
    );
  }

  btnTncClicked() {
    Get.toNamed('/tnc');
  }

  btnPrivacyPolicyClicked() {
    Get.toNamed('/privacy');
  }

  btnHelpClicked() {
    MbxHelpSheet.show();
  }

  btnLogoutClicked() {
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

  btnChangeAvatarClicked() async {
    final sheet = MbxAvatarSheet();
    await sheet.show();
  }
}
