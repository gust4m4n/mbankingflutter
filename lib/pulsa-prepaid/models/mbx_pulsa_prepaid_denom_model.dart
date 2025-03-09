import '../../utils/all_utils.dart';

class MbxPulsaPrepaidDenomModel {
  String name = '';
  int price = 0;

  MbxPulsaPrepaidDenomModel();

  MbxPulsaPrepaidDenomModel.fromJason(Jason jason) {
    name = jason['name'].stringValue;
    price = jason['price'].intValue;
  }
}
