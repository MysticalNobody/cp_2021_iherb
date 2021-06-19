import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticleModel {
  ArticleModel({
    required this.title,
    required this.tags,
    required this.photo,
    required this.text,
  });

  late String title;
  late List<String> tags;
  late String photo;
  late String text;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
}
