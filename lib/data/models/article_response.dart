import 'package:iherb/data/models/article_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  ArticleResponse({required this.feed});

  late List<ArticleModel> feed;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) => _$ArticleResponseFromJson(json);
}
