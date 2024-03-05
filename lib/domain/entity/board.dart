import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Board {
  String title;
  String subTitle;
  double width;
  double height;
  String path;
  Board({
    required this.title,
    required this.subTitle,
    required this.width,
    required this.height,
    required this.path,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subTitle': subTitle,
      'width': width,
      'height': height,
      'path': path,
    };
  }

  factory Board.fromMap(Map<String, dynamic> map) {
    return Board(
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      width: map['width'] as double,
      height: map['height'] as double,
      path: map['path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Board.fromJson(String source) =>
      Board.fromMap(json.decode(source) as Map<String, dynamic>);
}
