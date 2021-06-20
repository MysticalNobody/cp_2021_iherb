// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 5;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as String?,
      feel: fields[1] as String?,
      lifestyle: fields[2] as String?,
      diet: fields[3] as String?,
      sex: fields[4] as String?,
      pregnant: fields[5] as bool?,
      age: fields[6] as int?,
      weight: fields[7] as int?,
      height: fields[8] as int?,
      allergy: (fields[9] as List?)?.cast<String>(),
      chronic: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.feel)
      ..writeByte(2)
      ..write(obj.lifestyle)
      ..writeByte(3)
      ..write(obj.diet)
      ..writeByte(4)
      ..write(obj.sex)
      ..writeByte(5)
      ..write(obj.pregnant)
      ..writeByte(6)
      ..write(obj.age)
      ..writeByte(7)
      ..write(obj.weight)
      ..writeByte(8)
      ..write(obj.height)
      ..writeByte(9)
      ..write(obj.allergy)
      ..writeByte(10)
      ..write(obj.chronic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as String?,
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
