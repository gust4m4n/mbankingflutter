import 'package:get/get.dart';

class MbxFeedbackController extends GetxController {
  btnRatingClicked(int value) {
    Get.back(result: value);
  }
}
