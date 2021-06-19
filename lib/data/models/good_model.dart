import 'package:json_annotation/json_annotation.dart';

part 'good_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GoodModel {
  GoodModel({
    required this.title,
    required this.price,
    required this.photo,
  });

  late String title;
  late double price;
  late String photo;

  factory GoodModel.fromJson(Map<String, dynamic> json) => _$GoodModelFromJson(json);
}
