// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) {
  return ArticleModel(
    title: json['name'] as String,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    photo: convertImageFromJson(json['image'] as String),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'name': instance.title,
      'tags': instance.tags,
      'image': convertImageToJson(instance.photo),
      'text': instance.text,
    };
