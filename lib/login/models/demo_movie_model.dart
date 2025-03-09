
import '../../utils/all_utils.dart';

class DemoMovieModel {
  int movie_id = 0;
  String poster = '';
  int revenue = 0;
  String title = '';

  DemoMovieModel();

  DemoMovieModel.fromJason(Jason jason) {
    movie_id = jason['movie_id'].intValue;
    poster = jason['poster'].stringValue;
    revenue = jason['revenue'].intValue;
    title = jason['title'].stringValue;
  }

  DemoMovieModel.fromMap(Map<String, dynamic> map) {
    movie_id = map.getInt('movie_id');
    poster = map.getString('poster');
    revenue = map.getInt('revenue');
    title = map.getString('title');
  }

  Map<String, dynamic> toMap() {
    return {
      'movie_id': movie_id,
      'poster': poster,
      'revenue': revenue,
      'title': title,
    };
  }
}
