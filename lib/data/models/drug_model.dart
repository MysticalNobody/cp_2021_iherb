import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drug_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DrugModel {
  DrugModel({
    required this.date,
    required this.when,
    required this.type,
    required this.mg,
    required this.count,
  });

  String date;
  String when;
  DrugType type;
  int mg;
  int count;

  factory DrugModel.fromJson(Map<String, dynamic> json) =>
      _$DrugModelFromJson(json);
}

enum DrugType { d, c, b }

extension DrugExtention on DrugType {
  List<Color> get colors {
    switch (this) {
      case DrugType.d:
        return [Color(0xff30A885), Color(0xff41C59E)];
      case DrugType.c:
        return [Color(0xff367599), Color(0xff5396BB)];
      case DrugType.b:
        return [Color(0xffAF7738), Color(0xffC0823A)];
    }
  }

  String get name {
    switch (this) {
      case DrugType.d:
        return 'D';
      case DrugType.c:
        return 'C';
      case DrugType.b:
        return 'B';
    }
  }
}
