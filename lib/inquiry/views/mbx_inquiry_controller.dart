import '../../widget-x/all_widgets.dart';

class MbxInquiryController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  btnCloseClicked() {
    Get.back(result: false);
  }

  btnNextClicked() {
    Get.back(result: true);
  }
}
