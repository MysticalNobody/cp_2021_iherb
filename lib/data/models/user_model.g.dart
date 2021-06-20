// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as String,
    feel: json['feel'] as String?,
    lifestyle: json['lifestyle'] as String?,
    diet: json['diet'] as String?,
    sex: json['sex'] as String?,
    pregnant: json['pregnant'] as bool?,
    age: json['age'] as int?,
    weight: json['weight'] as int?,
    height: json['height'] as int?,
    allergy:
        (json['allergy'] as List<dynamic>?)?.map((e) => e as String).toList(),
    chronic: json['chronic'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'feel': instance.feel,
      'lifestyle': instance.lifestyle,
      'diet': instance.diet,
      'sex': instance.sex,
      'pregnant': instance.pregnant,
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'allergy': instance.allergy,
      'chronic': instance.chronic,
    };
