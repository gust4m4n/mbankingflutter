import 'package:mbxflutter/utils/all_utils.dart';

import '../../widget-x/all_widgets.dart';

class MbxStringPickerController extends GetxController {
  final List<String> list;
  List<String> filtered = [];
  TextEditingController txtSearch = TextEditingController();

  MbxStringPickerController({required this.list}) {
    this.filtered = list;
  }

  btnCloseClicked() {
    Get.back(result: null);
  }

  txtSearchChanged(String value) {
    LoggerX.log('txtSearchChanged: $value');
    filtered = list
        .where(
          (element) =>
              element.toLowerCase().contains(value.toLowerCase().trim()),
        )
        .toList();
    update();
  }
}
