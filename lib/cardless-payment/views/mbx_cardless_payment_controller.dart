import '../../cardless/models/mbx_cardless_step_model.dart';
import '../../widgets/all_widgets.dart';

class MbxCardlessPaymentController extends GetxController {
  List<MbxCardlessStepModel> steps = [];

  @override
  void onReady() {
    super.onReady();
    steps = Get.arguments as List<MbxCardlessStepModel>;
    update();
  }

  btnBackClicked() {
    Get.offAllNamed('/home');
  }
}
