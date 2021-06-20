import 'package:json_annotation/json_annotation.dart';

part 'good_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GoodModel {
  GoodModel({
    required this.title,
    required this.price,
    required this.photo,
    required this.url,
  });

  @JsonKey(name: 'Name')
  late String title;
  @JsonKey(name: 'ListPrice')
  late String price;
  @JsonKey(name: 'ProductImage')
  late String photo;
  @JsonKey(name: 'ProductUrl')
  String url;

  factory GoodModel.fromJson(Map<String, dynamic> json) =>
      _$GoodModelFromJson(json);
}
