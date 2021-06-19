// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodModel _$GoodModelFromJson(Map<String, dynamic> json) {
  return GoodModel(
    title: json['title'] as String,
    price: (json['price'] as num).toDouble(),
    photo: json['photo'] as String,
  );
}

Map<String, dynamic> _$GoodModelToJson(GoodModel instance) => <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'photo': instance.photo,
    };
