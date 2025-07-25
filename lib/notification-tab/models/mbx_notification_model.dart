import '../../utils/all_utils.dart';

class MbxNotificationModel {
  String createdAt = '';
  String description = '';
  int id = 0;
  bool readed = false;
  String title = '';

  MbxNotificationModel(Jason jason) {
    createdAt = jason['created_at'].stringValue;
    description = jason['description'].stringValue;
    id = jason['id'].intValue;
    readed = jason['readed'].boolValue;
    title = jason['title'].stringValue;
  }
}
