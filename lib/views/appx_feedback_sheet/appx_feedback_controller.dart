import 'package:get/get.dart';

class AppxFeedbackController extends GetxController {
  btnRatingClicked(int value) {
    Get.back(result: value);
  }
}
