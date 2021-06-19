import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

part 'quiz_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizModel {
  QuizModel({
    required this.title,
    required this.tags,
    required this.photo,
    required this.color,
  });

  late String title;
  late List<String> tags;
  late String photo;
  @JsonKey(
    fromJson: convertColorFromJson,
    toJson: convertColorToJson,
  )
  late Color color;

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);
}

Color convertColorFromJson(int color) => Color(color);
int convertColorToJson(Color color) => color.value;
