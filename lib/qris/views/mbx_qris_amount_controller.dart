import 'package:intl/intl.dart';
import 'package:mbxflutter/login/models/mbx_account_model.dart';
import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbxflutter/pin/views/mbx_pin_sheet.dart';
import 'package:mbxflutter/qris/models/mbx_qris_inquiry_model.dart';
import 'package:mbxflutter/qris/viewmodels/mbx_qris_payment_vm.dart';
import 'package:mbxflutter/receipt/viewmodels/mbx_receipt_vm.dart';
import 'package:mbxflutter/sof/views/mbx_sof_sheet.dart';
import 'package:mbxflutter/utils/all_utils.dart';

import '../../widget-x/all_widgets.dart';

class MbxQRISAmountController extends GetxController {
  final MbxQRISInquiryModel inquiry;

  final amountController = TextEditingController();
  final amountNode = FocusNode();
  var amountError = '';
  int amount = 0;

  var receiptVM = MbxReceiptVM();
  var sof = MbxAccountModel();

  MbxQRISAmountController({required this.inquiry});

  @override
  void onReady() {
    super.onReady();
    sof = MbxProfileVM.profile.accounts[0];
    update();

    update();
    amountNode.requestFocus();
  }

  btnBackClicked() {
    Get.back();
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

  txtAmountChanged(String value) {
    String newValue = value.replaceAll('.', '');
    int? intValue = int.tryParse(newValue);
    if (intValue != null) {
      amount = intValue;
      final formatter = NumberFormat('#,###');
      String formatted = formatter.format(intValue).replaceAll(',', '.');
      amountController.text = formatted;
      amountController.selection = TextSelection.fromPosition(
        TextPosition(offset: formatted.length),
      );
    } else {
      amount = 0;
      amountController.text = '';
    }
    update();
  }

  bool validate() {
    if (amountController.text.isEmpty || amount <= 0) {
      amountError = 'Masukkan nominal transfer.';
      update();
      amountNode.requestFocus();
      return false;
    }
    amountError = '';
    update();

    return true;
  }

  btnNextClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (validate() == true) {
      final pinSheet = MbxPinSheet();
      pinSheet.show(
        title: 'pin'.tr,
        message: 'enter_pin_message'.tr,
        secure: true,
        biometric: true,
        onSubmit: (code, biometric) async {
          LoggerX.log('[PIN] entered: $code biometric; $biometric');
          Get.loading();
          final qrisPaymentVM = MbxQRISPaymentVM();
          qrisPaymentVM.request(transactionId: inquiry.transactionId).then((
            resp,
          ) {
            Get.back();
            if (resp.status == 200) {
              Get.toNamed(
                '/receipt',
                arguments: {
                  'receipt': qrisPaymentVM.receipt,
                  'backToHome': true,
                  'askFeedback': true,
                },
              );
            }
          });
        },
        optionTitle: 'forgot_pin'.tr,
        optionClicked: () {
          pinSheet.clear('');
          ToastX.showSuccess(
            msg: 'pin_reset_message'.tr,
          );
        },
      );
    }
  }
}
