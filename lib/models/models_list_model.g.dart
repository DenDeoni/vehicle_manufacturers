// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelsListModelAdapter extends TypeAdapter<ModelsListModel> {
  @override
  final int typeId = 3;

  @override
  ModelsListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelsListModel(
      count: fields[0] as int,
      message: fields[1] as String,
      searchCriteria: fields[2] as String,
      results: (fields[3] as List).cast<ModelDetailsModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ModelsListModel obj) {
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
      other is ModelsListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
