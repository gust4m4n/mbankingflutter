import 'package:mbxflutter/biller-pulsa/postpaid/viewmodels/mbx_pulsa_postpaid_inquiry_vm.dart';
import 'package:mbxflutter/biller-pulsa/postpaid/viewmodels/mbx_pulsa_postpaid_payment_vm.dart';
import 'package:mbxflutter/inquiry/models/mbx_inquiry_model.dart';
import 'package:mbxflutter/login/models/mbx_account_model.dart';
import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbxflutter/pin/views/mbx_pin_sheet.dart';
import 'package:mbxflutter/sof/views/mbx_sof_sheet.dart';

import '../../../inquiry/views/mbx_inquiry_sheet.dart';
import '../../../widget-x/all_widgets.dart';

class MbxPulsaPostpaidController extends GetxController {
  var sof = MbxAccountModel();
  final customerIdController = TextEditingController();
  final customerIdNode = FocusNode();
  var customerIdError = '';

  @override
  void onReady() {
    super.onReady();
    sof = MbxProfileVM.profile.accounts[0];
    update();
  }

  btnBackClicked() {
    Get.back();
  }

  customerIdChanged(String value) {
    update();
  }

  btnSofClicked() {
    MbxSofSheet.show().then((sof) {
      if (sof != null) {
        this.sof = sof;
        update();
      }
    });
  }

  btnSofEyeClicked() {
    sof.visible = !sof.visible;
    update();
  }

  bool validate() {
    if (customerIdController.text.isEmpty) {
      customerIdError = 'Masukkan nomor handphone.';
      update();
      customerIdNode.requestFocus();
      return false;
    }
    customerIdError = '';
    update();

    return true;
  }

  bool readyToSubmit() {
    if (customerIdController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  btnNextClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (validate() == true) {
      inquiry();
    }
  }

  inquiry() {
    Get.loading();
    final inquiryVM = MbxPulsaPostpaidInquiryVM();
    inquiryVM.request().then((resp) {
      Get.back();
      if (resp.status == 200) {
        final sheet = MbxInquirySheet(
          title: 'confirmation'.tr,
          confirmBtnTitle: 'pay'.tr,
          inquiry: inquiryVM.inquiry,
        );
        sheet.show().then((value) {
          if (value == true) {
            authenticate(inquiry: inquiryVM.inquiry);
          }
        });
      } else {
        // inquiry request failed
      }
    });
  }

  authenticate({required MbxInquiryModel inquiry}) {
    final pinSheet = MbxPinSheet();
    pinSheet.show(
      title: 'pin'.tr,
      message: 'enter_pin_message'.tr,
      secure: true,
      biometric: true,
      onSubmit: (code, biometric) async {
        payment(transactionId: code, pin: code, biometric: biometric);
      },
      optionTitle: 'forgot_pin'.tr,
      optionClicked: () {
        pinSheet.clear('');
        ToastX.showSuccess(msg: 'pin_reset_message'.tr);
      },
    );
  }

  payment({
    required String transactionId,
    required String pin,
    required bool biometric,
  }) {
    Get.loading();
    final paymentVM = MbxPulsaPostpaidPaymentVM();
    paymentVM
        .request(transactionId: transactionId, pin: pin, biometric: biometric)
        .then((resp) {
          if (resp.status == 200) {
            Get.back();
            Get.offNamed(
              '/receipt',
              arguments: {
                'receipt': paymentVM.receipt,
                'backToHome': true,
                'askFeedback': true,
              },
            );
          } else {
            // payment request failed
          }
        });
  }
}
