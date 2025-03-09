import 'package:mbankingflutter/transfer/p2bank/models/mbx_transfer_p2bank_service_model.dart';

import '../../../widgets/all_widgets.dart';

class MbxTransferP2BankServicePickerController extends GetxController {
  final List<MbxTransferP2BankServiceModel> list;

  MbxTransferP2BankServicePickerController(this.list) {}

  @override
  void onReady() {
    super.onReady();
  }

  btnCloseClicked() {
    Get.back();
  }
}
