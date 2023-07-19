import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:quiver/core.dart';

import 'index.dart';

part 'vehicle_types_model.g.dart';

@immutable
@HiveType(typeId: 4)
class VehicleTypesModel {

  const VehicleTypesModel({
    required this.isPrimary,
    required this.name,
  });
  @HiveField(0)
  final bool isPrimary;
  @HiveField(1)
  final String name;

  factory VehicleTypesModel.fromJson(Map<String,dynamic> json) => VehicleTypesModel(
    isPrimary: json['IsPrimary'] as bool,
    name: json['Name'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'IsPrimary': isPrimary,
    'Name': name
  };

  VehicleTypesModel clone() => VehicleTypesModel(
    isPrimary: isPrimary,
    name: name
  );


  VehicleTypesModel copyWith({
    bool? isPrimary,
    String? name
  }) => VehicleTypesModel(
    isPrimary: isPrimary ?? this.isPrimary,
    name: name ?? this.name,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is VehicleTypesModel && isPrimary == other.isPrimary && name == other.name;

  @override
  int get hashCode => isPrimary.hashCode ^ name.hashCode;
}
