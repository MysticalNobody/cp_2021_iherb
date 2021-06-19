import 'package:json_annotation/json_annotation.dart';

part 'quiz_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizModel {
  QuizModel({
    required this.title,
    required this.tags,
    required this.photo,
  });

  late String title;
  late List<String> tags;
  late String photo;

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);
}
