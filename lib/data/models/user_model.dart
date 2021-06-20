import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  String? feel;
  String? lifestyle;
  String? diet;
  String? sex;
  bool? pregnant;
  int? age;
  int? weight;
  int? height;
  List<String>? allergy;
  String? chronic;

  UserModel({
    required this.id,
    this.feel,
    this.lifestyle,
    this.diet,
    this.sex,
    this.pregnant,
    this.age,
    this.weight,
    this.height,
    this.allergy,
    this.chronic,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
