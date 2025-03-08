import 'package:mbankingflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbankingflutter/viewmodels/mbx_pbb_inquiry_vm.dart';
import 'package:mbankingflutter/viewmodels/mbx_pbb_payment_vm.dart';

import '../../models/mbx_account_model.dart';
import '../../models/mbx_inquiry_model.dart';
import '../../pin-sheet/mbx_pin_sheet.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_inquiry_sheet/mbx_inquiry_sheet.dart';
import '../mbx_sof_sheet/mbx_sof_sheet.dart';
import '../mbx_string_picker/mbx_string_picker.dart';

class MbxPBBController extends GetxController {
  var sof = MbxAccountModel();

  final nopController = TextEditingController();
  final nopNode = FocusNode();
  var nopError = '';

  var yearSelected = '';
  var yearError = '';

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

  nopChanged(String value) {
    update();
  }

  btnPickYearClicked() {
    List<String> years = [];
    for (int i = 1990; i <= DateTime.now().year; i++) {
      years.insert(0, i.toString());
    }

    final picker = MbxStringPicker(title: 'Pilih Tahun', list: years);
    picker.show().then((selectedIndex) {
      if (selectedIndex != null) {
        yearSelected = years[selectedIndex];
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
    if (nopController.text.isEmpty) {
      nopError = 'Masukkan NOP.';
      update();
      nopNode.requestFocus();
      return false;
    }
    nopError = '';

    if (yearSelected.isEmpty) {
      yearError = 'Pilih tahun';
      update();
      return false;
    }
    yearError = '';

    update();
    return true;
  }

  bool readyToSubmit() {
    if (nopController.text.isNotEmpty && yearSelected.isNotEmpty) {
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
    final inquiryVM = MbxPBBInquiryVM();
    inquiryVM.request().then((resp) {
      Get.back();
      if (resp.status == 200) {
        final sheet = MbxInquirySheet(
            title: 'Konfirmasi',
            confirmBtnTitle: 'Bayar',
            inquiry: inquiryVM.inquiry);
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

  payment(
      {required String transaction_id,
      required String pin,
      required bool biometric}) {
    Get.loading();
    final paymentVM = MbxPBBPaymentVM();
    paymentVM
        .request(transaction_id: transaction_id, pin: pin, biometric: biometric)
        .then((resp) {
      if (resp.status == 200) {
        Get.back();
        Get.offNamed('/receipt', arguments: {
          'receipt': paymentVM.receipt,
          'backToHome': true,
          'askFeedback': true
        });
      } else {
        // payment request failed
      }
    });
  }
}
