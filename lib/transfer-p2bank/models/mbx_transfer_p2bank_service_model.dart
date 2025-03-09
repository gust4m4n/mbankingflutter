import '../../utils/all_utils.dart';

class MbxTransferP2BankServiceModel {
  String code = '';
  String name = '';
  int minimum = 0;
  int fee = 0;

  MbxTransferP2BankServiceModel();

  MbxTransferP2BankServiceModel.fromJason(Jason jason) {
    code = jason['code'].stringValue;
    name = jason['name'].stringValue;
    minimum = jason['minimum'].intValue;
    fee = jason['fee'].intValue;
  }
}
