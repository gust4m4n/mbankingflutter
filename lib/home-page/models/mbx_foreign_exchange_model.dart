import '../../utils/all_utils.dart';

class MbxForeignExchangeModel {
  String currency = '';
  double buy = 0;
  double sell = 0;

  MbxForeignExchangeModel();

  MbxForeignExchangeModel.fromJason(Jason jason) {
    currency = jason['currency'].stringValue;
    buy = jason['buy'].doubleValue;
    sell = jason['sell'].doubleValue;
  }
}
