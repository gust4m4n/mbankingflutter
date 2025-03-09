import '../../utils/all_utils.dart';

class MbxPulsaDataPlanDenomModel {
  String name = '';
  int price = 0;

  MbxPulsaDataPlanDenomModel();

  MbxPulsaDataPlanDenomModel.fromJason(Jason jason) {
    name = jason['name'].stringValue;
    price = jason['price'].intValue;
  }
}
