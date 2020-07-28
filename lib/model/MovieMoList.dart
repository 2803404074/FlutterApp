import 'MovieMo.dart';

class MovieMoList {
  String title;

  List<MovieMo> list;

  MovieMoList({this.title, this.list});

  factory MovieMoList.fromJson(Map<String, dynamic> parsedJson) {
    return MovieMoList(
      title: parsedJson['title'],
      list: parsedJson['list'],
    );
  }
}
