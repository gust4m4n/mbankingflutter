import '../../models/mbx_transfer_p2bank_dest_model.dart';
import '../../viewmodels/mbx_transfer_p2bank_dest_list_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxTransferP2BankPickerController extends GetxController {
  TextEditingController txtSearch = TextEditingController();
  var loading = true;
  var destListVM = MbxTransferP2BankDestListVM();

  @override
  void onReady() {
    super.onReady();
    update();
    destListVM.nextPage().then((resp) {
      loading = false;
      destListVM.sort();
      destListVM.setFilter('');
      update();
    });
  }

  btnCloseClicked() {
    Get.back(result: null);
  }

  txtSearchChanged(String value) {
    destListVM.setFilter(value);
    update();
  }

  onDeleteClicked(MbxTransferP2BankDestModel dest) {
    SheetX.showMessage(
        title: 'Hapus',
        message:
            'Apakah anda yakin ingin menghapus ${dest.name} dengan nomor rekening ${dest.account} ?',
        leftBtnTitle: 'Ya',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: 'Tidak',
        onRightBtnClicked: () {
          Get.back();
        });
  }

  onAddClicked() {
  }
}
