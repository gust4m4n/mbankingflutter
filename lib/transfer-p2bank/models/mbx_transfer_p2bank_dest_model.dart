import '../../utils/all_utils.dart';

class MbxTransferP2BankDestModel {
  String account = '';
  String bank = '';
  String bank_icon = '';
  String name = '';

  MbxTransferP2BankDestModel();

  MbxTransferP2BankDestModel.fromJason(Jason jason) {
    account = jason['account'].stringValue;
    bank = jason['bank'].stringValue;
    bank_icon = jason['bank_icon'].stringValue;
    name = jason['name'].stringValue;
  }
}
