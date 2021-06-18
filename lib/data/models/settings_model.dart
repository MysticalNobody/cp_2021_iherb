import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class SettingsModel {

  @HiveField(0)
  bool? isDarkTheme = false;

  @HiveField(1)
  String? language;

  SettingsModel({this.isDarkTheme,this.language});

  factory SettingsModel.fromJson(Map<String, dynamic> json) => _$SettingsModelFromJson(json);

}
