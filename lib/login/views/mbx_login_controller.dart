import 'package:mbxflutter/language/models/language_preferences.dart';
import 'package:mbxflutter/language/views/mbx_language_controller.dart';
import 'package:mbxflutter/language/views/mbx_language_sheet.dart';
import 'package:mbxflutter/login/viewmodels/mbx_login_otp_vm.dart';
import 'package:mbxflutter/login/viewmodels/mbx_login_phone_vm.dart';
import 'package:mbxflutter/login/viewmodels/mbx_login_pin_vm.dart';
import 'package:mbxflutter/login/viewmodels/mbx_onboarding_list_vm.dart';
import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbxflutter/otp/views/mbx_otp_sheet.dart';
import 'package:mbxflutter/pin/views/mbx_pin_sheet.dart';
import 'package:mbxflutter/theme/viewmodels/mbx_theme_vm.dart';
import 'package:mbxflutter/utils/logger_x.dart';
import 'package:mbxflutter/widget-x/all_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'mbx_login_screen.dart';

class MbxLoginController extends GetxController {
  final PageController pageController = PageController();
  var onboardingVM = MbxOnboardingListVM();
  final txtPhoneController = TextEditingController();
  final txtPhoneNode = FocusNode();
  var phoneError = '';
  var loginEnabled = false;
  var version = '';
  var onboardingIndex = 0;

  MbxLanguageController get languageController =>
      Get.find<MbxLanguageController>();
  @override
  void onReady() {
    super.onReady();
    PackageInfo.fromPlatform().then((info) {
      version = 'Version ${info.version}';
      update();
    });

    onboardingVM.nextPage().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });
  }

  btnThemeClicked() {
    MbxThemeVM.change().then((value) {
      if (value) {
        Get.offAllNamed('/login');
      }
    });
  }

  btnLanguageClicked() {
    MbxLanguageSheet.show();
  }

  String getCurrentLanguageFlag() {
    return LanguagePreferences.getLanguageFlag(
      languageController.currentLanguage,
    );
  }

  String getCurrentLanguageName() {
    return LanguagePreferences.getLanguageName(
      languageController.currentLanguage,
    );
  }

  txtPhoneOnChanged(String value) {
    loginEnabled = value.isNotEmpty;
    update();
  }

  btnStartClicked() {
    Get.to(MbxLoginScreen());
  }

  setOnboardingIndex(int index) {
    onboardingIndex = index;
    update();
  }

  btnLoginClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    phoneError = '';
    update();

    if (txtPhoneController.text.trim().isEmpty) {
      phoneError = 'Nomor handphone tidak boleh kosong.';
      FocusScope.of(Get.context!).requestFocus(txtPhoneNode);
      update();
      return;
    }

    Get.loading();
    MbxLoginPhoneVM.request(phone: txtPhoneController.text).then((resp) {
      Get.back();
      if (resp.status == 200) {
        askOtp(txtPhoneController.text);
      } else {
        SheetX.showMessage(
          title: 'login'.tr,
          message: resp.message,
          leftBtnTitle: 'ok'.tr,
          onLeftBtnClicked: () {
            Get.back();
          },
        );
      }
    });
  }

  askOtp(String phone) {
    final pinSheet = MbxOtpSheet();
    pinSheet
        .show(
          title: 'otp'.tr,
          message: 'enter_otp_message'.tr,
          secure: false,
          biometric: false,
          onSubmit: (code, biometric) async {
            LoggerX.log('[OTP] entered: $code');
            Get.loading();
            final resp = await MbxLoginOtpVM.request(phone: phone, otp: code);
            Get.back();
            if (resp.status == 200) {
              LoggerX.log('[OTP] verfied: $code');
              Get.back();
              Get.loading();
              Future.delayed(const Duration(milliseconds: 500), () {
                Get.back();
                askPin(phone, code);
              });
            } else {}
          },
          optionTitle: 'resend'.tr,
          optionClicked: () {
            pinSheet.clear('');
            ToastX.showSuccess(msg: 'otp_resent_success'.tr);
          },
        )
        .then((code) {
          if (code != null && (code as String).isNotEmpty) {
            LoggerX.log('[OTP] verfied: $code');
            askPin(phone, code);
          }
        });
  }

  askPin(String phone, String otp) {
    final pinSheet = MbxPinSheet();
    pinSheet.show(
      title: 'pin'.tr,
      message: 'enter_pin_message'.tr,
      secure: true,
      biometric: false,
      onSubmit: (code, biometric) async {
        LoggerX.log('[PIN] entered: $code');
        Get.loading();
        final resp = await MbxLoginPinVM.request(phone: '', otp: '', pin: code);
        if (resp.status == 200) {
          LoggerX.log('[PIN] verfied: $code');
          MbxProfileVM.request().then((resp) {
            Get.offAllNamed('/home');
          });
        } else {
          Get.back();
        }
      },
      optionTitle: 'forgot_pin'.tr,
      optionClicked: () {
        pinSheet.clear('');
        ToastX.showSuccess(msg: 'pin_reset_message'.tr);
      },
    );
  }
}
