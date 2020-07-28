class MovieMo {
  String title;
  String imgUrl;
  String decodeStr;

  MovieMo({this.title, this.imgUrl, this.decodeStr});

  factory MovieMo.fromJson(Map<String, dynamic> parsedJson) {
    return MovieMo(
        title: parsedJson['_title'],
        imgUrl: parsedJson['_imgUrl'],
        decodeStr: parsedJson['_decodeStr']);
  }
}
