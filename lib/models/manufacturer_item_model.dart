import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:quiver/core.dart';

import 'index.dart';

part 'manufacturer_item_model.g.dart';

@immutable
@HiveType(typeId: 1)
class ManufacturerItemModel {
  const ManufacturerItemModel({
    required this.country,
    this.mfrCommonName,
    required this.mfrID,
    required this.mfrName,
    required this.vehicleTypes,
  });
  @HiveField(0)
  final String country;
  @HiveField(1)
  final String? mfrCommonName;
  @HiveField(2)
  final int mfrID;
  @HiveField(3)
  final String mfrName;
  @HiveField(4)
  final List<VehicleTypesModel> vehicleTypes;

  factory ManufacturerItemModel.fromJson(Map<String, dynamic> json) => ManufacturerItemModel(
        country: json['Country'].toString(),
        mfrCommonName: json['Mfr_CommonName']?.toString(),
        mfrID: json['Mfr_ID'] is String ? int.parse(json['Mfr_ID']) : json['Mfr_ID'] as int,
        mfrName: json['Mfr_Name'].toString(),
        vehicleTypes: (json['VehicleTypes'] as List? ?? [])
            .map((e) => VehicleTypesModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  factory ManufacturerItemModel.empty() => const ManufacturerItemModel(
        country: '',
        mfrCommonName: '',
        mfrID: 0,
        mfrName: '',
        vehicleTypes: [],
      );

  Map<String, dynamic> toJson() => {
        'Country': country,
        'Mfr_CommonName': mfrCommonName,
        'Mfr_ID': mfrID,
        'Mfr_Name': mfrName,
        'VehicleTypes': vehicleTypes.map((e) => e.toJson()).toList()
      };

  ManufacturerItemModel clone() => ManufacturerItemModel(
      country: country,
      mfrCommonName: mfrCommonName,
      mfrID: mfrID,
      mfrName: mfrName,
      vehicleTypes: vehicleTypes.map((e) => e.clone()).toList());

  ManufacturerItemModel copyWith(
          {String? country,
          Optional<String?>? mfrCommonName,
          int? mfrID,
          String? mfrName,
          List<VehicleTypesModel>? vehicleTypes}) =>
      ManufacturerItemModel(
        country: country ?? this.country,
        mfrCommonName: checkOptional(mfrCommonName, () => this.mfrCommonName),
        mfrID: mfrID ?? this.mfrID,
        mfrName: mfrName ?? this.mfrName,
        vehicleTypes: vehicleTypes ?? this.vehicleTypes,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManufacturerItemModel &&
          country == other.country &&
          mfrCommonName == other.mfrCommonName &&
          mfrID == other.mfrID &&
          mfrName == other.mfrName &&
          vehicleTypes == other.vehicleTypes;

  @override
  int get hashCode =>
      country.hashCode ^ mfrCommonName.hashCode ^ mfrID.hashCode ^ mfrName.hashCode ^ vehicleTypes.hashCode;
}
