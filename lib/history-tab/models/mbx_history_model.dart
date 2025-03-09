import '../../utils/all_utils.dart';

class MbxHistoryModel {
  int amount = 0;
  String created_at = '';
  String description = '';
  int id = 0;
  String title = '';

  MbxHistoryModel(Jason jason) {
    amount = jason['amount'].intValue;
    created_at = jason['created_at'].stringValue;
    description = jason['description'].stringValue;
    id = jason['id'].intValue;
    title = jason['title'].stringValue;
  }
}
