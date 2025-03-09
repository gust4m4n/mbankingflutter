import '../../utils/all_utils.dart';

class MbxNotificationModel {
  String created_at = '';
  String description = '';
  int id = 0;
  bool readed = false;
  String title = '';

  MbxNotificationModel(Jason jason) {
    created_at = jason['created_at'].stringValue;
    description = jason['description'].stringValue;
    id = jason['id'].intValue;
    readed = jason['readed'].boolValue;
    title = jason['title'].stringValue;
  }
}
