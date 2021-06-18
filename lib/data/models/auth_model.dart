import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class AuthModel {
  AuthModel(this.token);

  @HiveField(0)
  late String token;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);
}
