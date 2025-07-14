import '../../../widget-x/all_widgets.dart';

class MbxElectricityController extends GetxController {
  btnCloseClicked() {
    Get.back();
  }

  btnPrepaidClicked() {
    Get.back();
    Get.toNamed('/electricity/prepaid');
  }

  btnPostpaidClicked() {
    Get.back();
    Get.toNamed('/electricity/postpaid');
  }

  btnNonTagLisClicked() {
    Get.back();
    Get.toNamed('/electricity/nontaglis');
  }
}
