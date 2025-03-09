import '../../utils/all_utils.dart';

class MbxCardlessStepModel {
  int no = 0;
  String message = '';

  MbxCardlessStepModel();

  MbxCardlessStepModel.fromJason(Jason jason) {
    no = jason['no'].intValue;
    message = jason['message'].stringValue;
  }
}
