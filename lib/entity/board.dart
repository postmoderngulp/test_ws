import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

//Класс для хранения и манипулирования экранами onboard
//28.02.2024
//Безбородов С.Э
//
class Board {
  String title; //Заголовок экрана onboard
  String subTitle; //Подзаголовок экрана onboard
  double width; //Ширина изображения onboard
  double height; //Высота изображения onboard
  String path; //Имя изображения onboard
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

  @override
  bool operator ==(covariant Board other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.subTitle == subTitle &&
        other.width == width &&
        other.height == height &&
        other.path == path;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subTitle.hashCode ^
        width.hashCode ^
        height.hashCode ^
        path.hashCode;
  }
}
