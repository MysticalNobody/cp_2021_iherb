import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  ArticleModel({
    required this.title,
    required this.tags,
    required this.photo,
    required this.text,
  });

  @JsonKey(name: 'name')
  late String title;
  late List<String> tags;
  @JsonKey(
    name: 'image',
    fromJson: convertImageFromJson,
    toJson: convertImageToJson,
  )
  late String photo;
  late String text;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
}

String convertImageFromJson(String url) => 'https://iherb.herokuapp.com/images/$url';
String convertImageToJson(String? url) => url ?? '';
