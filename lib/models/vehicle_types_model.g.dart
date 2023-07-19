// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_types_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleTypesModelAdapter extends TypeAdapter<VehicleTypesModel> {
  @override
  final int typeId = 4;

  @override
  VehicleTypesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleTypesModel(
      isPrimary: fields[0] as bool,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VehicleTypesModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isPrimary)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleTypesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
