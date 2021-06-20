import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@HiveType(typeId: 5)
@JsonSerializable(explicitToJson: true)
class UserModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? feel;
  @HiveField(2)
  String? lifestyle;
  @HiveField(3)
  String? diet;
  @HiveField(4)
  String? sex;
  @HiveField(5)
  bool? pregnant;
  @HiveField(6)
  int? age;
  @HiveField(7)
  int? weight;
  @HiveField(8)
  int? height;
  @HiveField(9)
  List<String>? allergy;
  @HiveField(10)
  String? chronic;

  UserModel({
    this.id,
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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
