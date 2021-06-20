import 'package:iherb/data/models/good_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel({
    required this.id,
    required this.good,
  });

  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'Product')
  GoodModel good;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
