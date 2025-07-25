import '../../widget-x/all_widgets.dart';

class MbxInquiryController extends GetxController {
  btnCloseClicked() {
    Get.back(result: false);
  }

  btnNextClicked() {
    Get.back(result: true);
  }
}
