// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodModel _$GoodModelFromJson(Map<String, dynamic> json) {
  return GoodModel(
    title: json['Name'] as String,
    price: json['ListPrice'] as String,
    photo: json['ProductImage'] as String,
    url: json['ProductUrl'] as String,
  );
}

Map<String, dynamic> _$GoodModelToJson(GoodModel instance) => <String, dynamic>{
      'Name': instance.title,
      'ListPrice': instance.price,
      'ProductImage': instance.photo,
      'ProductUrl': instance.url,
    };
