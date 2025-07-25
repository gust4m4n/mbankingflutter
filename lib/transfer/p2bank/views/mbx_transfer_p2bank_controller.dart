import 'package:intl/intl.dart';
import 'package:mbxflutter/inquiry/models/mbx_inquiry_model.dart';
import 'package:mbxflutter/inquiry/views/mbx_inquiry_sheet.dart';
import 'package:mbxflutter/login/models/mbx_account_model.dart';
import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbxflutter/pin/views/mbx_pin_sheet.dart';
import 'package:mbxflutter/sof/views/mbx_sof_sheet.dart';
import 'package:mbxflutter/transfer/p2bank/models/mbx_transfer_p2bank_dest_model.dart';
import 'package:mbxflutter/transfer/p2bank/models/mbx_transfer_p2bank_service_model.dart';
import 'package:mbxflutter/transfer/p2bank/viewmodels/mbx_transfer_p2bank_inquiry_vm.dart';
import 'package:mbxflutter/transfer/p2bank/viewmodels/mbx_transfer_p2bank_payment_vm.dart';
import 'package:mbxflutter/transfer/p2bank/viewmodels/mbx_transfer_p2bank_service_list_vm.dart';
import 'package:mbxflutter/transfer/p2bank/views/mbx_transfer_p2bank_picker.dart';
import 'package:mbxflutter/transfer/p2bank/views/mbx_transfer_p2bank_service_picker.dart';

import '../../../widget-x/all_widgets.dart';

class MbxTransfeP2BankController extends GetxController {
  var dest = MbxTransferP2BankDestModel();
  var destError = '';

  final amountController = TextEditingController();
  final amountNode = FocusNode();
  var amountError = '';
  int amount = 0;

  final messageController = TextEditingController();
  final messageNode = FocusNode();
  var messageError = '';

  var service = MbxTransferP2BankServiceModel();
  var serviceError = '';
  var sof = MbxAccountModel();
  final transferServiceListVM = MbxTransferP2BankServiceListVM();

  @override
  void onReady() {
    super.onReady();
    sof = MbxProfileVM.profile.accounts[0];
    update();

    transferServiceListVM.request().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });
  }

  btnBackClicked() {
    Get.back();
  }

  btnPickDestinationClicked() {
    final picker = MbxTransferP2BankPicker();
    picker.show().then((value) {
      if (value != null) {
        dest = value;
        update();
      }
    });
  }

  btnClearClicked() {
    dest = MbxTransferP2BankDestModel();
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

  btnTransferServiceClicked() {
    MbxTransferP2BankServicePicker.show(transferServiceListVM.list).then((
      service,
    ) {
      if (service != null) {
        this.service = service;
        update();
      }
    });
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
    if (dest.account.isEmpty) {
      destError = 'Pilih rekening tujuan terlebih dahulu.';
      update();
      return false;
    }
    destError = '';

    if (amountController.text.isEmpty || amount <= 0) {
      amountError = 'Masukkan nominal transfer.';
      update();
      amountNode.requestFocus();
      return false;
    }
    amountError = '';

    if (service.code.isEmpty) {
      serviceError = 'Pilih layanan transfer yang diinginkan.';
      update();
      return false;
    }
    serviceError = '';

    if (messageController.text.isEmpty) {
      messageError = 'Berita harus diisi.';
      update();
      messageNode.requestFocus();
      return false;
    }
    messageError = '';
    update();

    return true;
  }

  bool readyToSubmit() {
    if (dest.account.isNotEmpty &&
        amount > 0 &&
        service.code.isNotEmpty &&
        messageController.text.isNotEmpty) {
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
    final inquiryVM = MbxTransferP2BankInquiryVM();
    inquiryVM.request().then((resp) {
      Get.back();
      if (resp.status == 200) {
        final sheet = MbxInquirySheet(
          title: 'confirmation'.tr,
          confirmBtnTitle: 'Transfer',
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
    final paymentVM = MbxTransferP2BankPaymentVM();
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
