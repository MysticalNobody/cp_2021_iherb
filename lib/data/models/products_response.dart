import 'package:json_annotation/json_annotation.dart';
import 'package:iherb/data/models/product_model.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  ProductsResponse({required this.result});

  List<ProductModel> result;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);
}
