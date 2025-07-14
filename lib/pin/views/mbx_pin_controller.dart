import 'package:mbxflutter/preferences/mbx_preferences_vm+users.dart';
import 'package:mbxflutter/profile-tab/mbx_biometric_vm.dart';

import '../../widget-x/all_widgets.dart';
import 'mbx_pin_sheet.dart';

class MbxPinController extends GetxController {
  final MbxPinSheet widget;
  String code = '';
  String error = '';
  bool biometricEnabled = false;

  MbxPinController({required this.widget});

  @override
  void onReady() {
    super.onReady();
    btnBiometricClicked();
  }

  btnCloseClicked() {
    Get.back();
  }

  btnKeypadClicked(String digit) {
    if (code.length < 6) {
      code = code + digit;
      update();
      if (code.length == 6) {
        widget.onSubmit!(code, false);
      }
    }
  }

  btnBiometricClicked() {
    if (widget.biometric) {
      MbxUserPreferencesVM.getBiometricEnabled().then((value) {
        biometricEnabled = value;
        update();
        if (value) {
          MbxBiometricVM.available().then((available) {
            if (available) {
              MbxBiometricVM.authenticate().then((authenticated) {
                if (authenticated == true) {
                  widget.onSubmit!('', true);
                }
              });
            }
          });
        }
      });
    }
  }

  btnBackspaceClicked() {
    if (code.length > 0) {
      code = code.substring(0, code.length - 1);
      update();
    }
  }

  clear(String error) {
    code = '';
    this.error = error;
    update();
  }
}
