import '../../utils/all_utils.dart';

class MbxNewsModel {
  static final double imageAspectRatio = 9.0 / 16.0;

  int newsId = 0;
  String image = '';
  String title = '';
  String content = '';

  MbxNewsModel();

  MbxNewsModel.fromJason(Jason jason) {
    newsId = jason['news_id'].intValue;
    image = jason['image'].stringValue;
    title = jason['title'].stringValue;
    content = jason['content'].stringValue;
  }
}
