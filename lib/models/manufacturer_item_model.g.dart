// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ManufacturerItemModelAdapter extends TypeAdapter<ManufacturerItemModel> {
  @override
  final int typeId = 1;

  @override
  ManufacturerItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManufacturerItemModel(
      country: fields[0] as String,
      mfrCommonName: fields[1] as String?,
      mfrID: fields[2] as int,
      mfrName: fields[3] as String,
      vehicleTypes: (fields[4] as List).cast<VehicleTypesModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ManufacturerItemModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.mfrCommonName)
      ..writeByte(2)
      ..write(obj.mfrID)
      ..writeByte(3)
      ..write(obj.mfrName)
      ..writeByte(4)
      ..write(obj.vehicleTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManufacturerItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
