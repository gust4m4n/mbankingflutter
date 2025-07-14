import 'package:mbxflutter/biller-pln/nontaglis/viewmodels/mbx_electricity_nontaglis_inquiry_vm.dart';
import 'package:mbxflutter/biller-pln/nontaglis/viewmodels/mbx_electricity_nontaglis_payment_vm.dart';
import 'package:mbxflutter/inquiry/models/mbx_inquiry_model.dart';
import 'package:mbxflutter/login/models/mbx_account_model.dart';
import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbxflutter/pin/views/mbx_pin_sheet.dart';
import 'package:mbxflutter/sof/views/mbx_sof_sheet.dart';

import '../../../inquiry/views/mbx_inquiry_sheet.dart';
import '../../../widget-x/all_widgets.dart';

class MbxElectricityNonTagLisController extends GetxController {
  var sof = MbxAccountModel();
  final customerIdController = TextEditingController();
  final customerIdNode = FocusNode();
  var customerIdError = '';

  @override
  void onInit() {
    super.onInit();
  }

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
      customerIdError = 'Masukkan ID pelanggan.';
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
    final inquiryVM = MbxElectricityNonTagLisInquiryVM();
    inquiryVM.request().then((resp) {
      Get.back();
      if (resp.status == 200) {
        final sheet = MbxInquirySheet(
          title: 'Konfirmasi',
          confirmBtnTitle: 'Bayar',
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
      title: 'PIN',
      message: 'Masukkan nomor pin m-banking atau ATM anda.',
      secure: true,
      biometric: true,
      onSubmit: (code, biometric) async {
        payment(transaction_id: code, pin: code, biometric: biometric);
      },
      optionTitle: 'Lupa PIN',
      optionClicked: () {
        pinSheet.clear('');
        ToastX.showSuccess(msg: 'PIN akan direset, silahkan hubungi CS kami.');
      },
    );
  }

  payment({
    required String transaction_id,
    required String pin,
    required bool biometric,
  }) {
    Get.loading();
    final paymentVM = MbxElectricityNonTagLisPaymentVM();
    paymentVM
        .request(transaction_id: transaction_id, pin: pin, biometric: biometric)
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
