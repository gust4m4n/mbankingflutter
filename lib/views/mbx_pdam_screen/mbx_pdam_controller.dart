import 'package:mbankingflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbankingflutter/models/mbx_pdam_area_model.dart';

import '../../models/mbx_account_model.dart';
import '../../models/mbx_inquiry_model.dart';
import '../../pin-sheet/views/mbx_pin_sheet.dart';
import '../../viewmodels/mbx_pdam_area_list_vm.dart';
import '../../viewmodels/mbx_pdam_inquiry_vm.dart';
import '../../viewmodels/mbx_pdam_payment_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_inquiry_sheet/mbx_inquiry_sheet.dart';
import '../mbx_sof_sheet/mbx_sof_sheet.dart';
import '../mbx_string_picker/mbx_string_picker.dart';

class MbxPDAMController extends GetxController {
  var sof = MbxAccountModel();

  var areaSelected = MbxPDAMAreaModel();
  var areaError = '';

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

  btnAreaClicked() {
    Get.loading();
    final pdamAreaListVM = MbxPDAMAreaListVM();
    pdamAreaListVM.request().then((resp) {
      Get.back();
      if (resp.status == 200) {
        List<String> list = [];
        for (final item in pdamAreaListVM.list) {
          list.add(item.name);
        }
        final picker = MbxStringPicker(title: 'Wilayah', list: list);
        picker.show().then((selectedIndex) {
          if (selectedIndex != null) {
            areaSelected = pdamAreaListVM.list[selectedIndex];
            update();
          }
        });
      }
    });
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
    if (areaSelected.id.isEmpty) {
      areaError = 'Pilih wilayah';
      update();
      return false;
    }
    areaError = '';

    if (customerIdController.text.isEmpty) {
      customerIdError = 'Masukkan nomor pelanggan.';
      update();
      customerIdNode.requestFocus();
      return false;
    }
    customerIdError = '';

    update();
    return true;
  }

  bool readyToSubmit() {
    if (areaSelected.id.isNotEmpty && customerIdController.text.isNotEmpty) {
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
    final inquiryVM = MbxPDAMInquiryVM();
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
    final paymentVM = MbxPDAMPaymentVM();
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
