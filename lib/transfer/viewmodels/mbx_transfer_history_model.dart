import '../../utils/all_utils.dart';

class MbxTransferHistoryModel {
  String transaction_id = '';
  String name = '';
  String bank = '';
  String account = '';
  int amount = 0;
  String type = '';
  String date = '';

  MbxTransferHistoryModel();

  MbxTransferHistoryModel.fromJason(Jason jason) {
    transaction_id = jason['transaction_id'].stringValue;
    name = jason['name'].stringValue;
    bank = jason['bank'].stringValue;
    account = jason['account'].stringValue;
    amount = jason['amount'].intValue;
    type = jason['type'].stringValue;
    date = jason['date'].stringValue;
  }
}
