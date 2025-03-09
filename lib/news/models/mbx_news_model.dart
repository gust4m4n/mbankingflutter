import '../../utils/all_utils.dart';

class MbxNewsModel {
  static final double imageAspectRatio = 9.0 / 16.0;

  int news_id = 0;
  String image = '';
  String title = '';
  String content = '';

  MbxNewsModel();

  MbxNewsModel.fromJason(Jason jason) {
    news_id = jason['news_id'].intValue;
    image = jason['image'].stringValue;
    title = jason['title'].stringValue;
    content = jason['content'].stringValue;
  }
}
