import 'package:mbankingflutter/utils/all_utils.dart';

class MbxPrivacyPolicyModel {
  String title = '';
  String content = '';

  MbxPrivacyPolicyModel();

  MbxPrivacyPolicyModel.fromJason(Jason jason) {
    title = jason['title'].stringValue;
    content = jason['content'].stringValue;
  }
}
