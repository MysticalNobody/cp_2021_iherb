// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return ArticleModel(
    title: json['title'] as String,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    photo: json['photo'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'tags': instance.tags,
      'photo': instance.photo,
      'text': instance.text,
    };
