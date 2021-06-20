// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugModel _$DrugModelFromJson(Map<String, dynamic> json) {
  return DrugModel(
    date: json['date'] as String,
    when: json['when'] as String,
    type: _$enumDecode(_$DrugTypeEnumMap, json['type']),
    mg: json['mg'] as int,
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$DrugModelToJson(DrugModel instance) => <String, dynamic>{
      'date': instance.date,
      'when': instance.when,
      'type': _$DrugTypeEnumMap[instance.type],
      'mg': instance.mg,
      'count': instance.count,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$DrugTypeEnumMap = {
  DrugType.d: 'd',
  DrugType.c: 'c',
  DrugType.b: 'b',
};
