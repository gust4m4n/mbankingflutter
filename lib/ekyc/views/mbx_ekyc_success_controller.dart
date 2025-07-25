import '../../widget-x/all_widgets.dart';

class MbxEkycSuccessController extends GetxController {
  btnBackToHomeClicked() {
    // Navigate back to home and clear eKYC stack
    Get.offAllNamed('/home');
  }
}
