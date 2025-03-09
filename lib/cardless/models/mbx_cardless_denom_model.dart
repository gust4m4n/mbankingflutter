import '../../utils/all_utils.dart';

class MbxCardlessDenomModel {
  int nominal = 0;

  MbxCardlessDenomModel();

  MbxCardlessDenomModel.fromJason(Jason jason) {
    nominal = jason['nominal'].intValue;
  }
}
