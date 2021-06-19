// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) {
  return QuizModel(
    title: json['title'] as String,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    photo: json['photo'] as String,
    color: convertColorFromJson(json['color'] as int),
  );
}

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'title': instance.title,
      'tags': instance.tags,
      'photo': instance.photo,
      'color': convertColorToJson(instance.color),
    };
