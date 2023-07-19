// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ManufacturerListModelAdapter extends TypeAdapter<ManufacturerListModel> {
  @override
  final int typeId = 0;

  @override
  ManufacturerListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ManufacturerListModel(
      count: fields[0] as int,
      message: fields[1] as String,
      searchCriteria: fields[2] as dynamic,
      results: (fields[3] as List).cast<ManufacturerItemModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ManufacturerListModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.searchCriteria)
      ..writeByte(3)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManufacturerListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
