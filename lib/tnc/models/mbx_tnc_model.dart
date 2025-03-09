import 'package:mbankingflutter/utils/all_utils.dart';

class MbxTncModel {
  String title = '';
  String content = '';

  MbxTncModel();

  MbxTncModel.fromJason(Jason jason) {
    title = jason['title'].stringValue;
    content = jason['content'].stringValue;
  }
}
