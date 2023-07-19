// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelDetailsModelAdapter extends TypeAdapter<ModelDetailsModel> {
  @override
  final int typeId = 2;

  @override
  ModelDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelDetailsModel(
      makeID: fields[0] as int,
      makeName: fields[1] as String,
      modelID: fields[2] as int,
      modelName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelDetailsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.makeID)
      ..writeByte(1)
      ..write(obj.makeName)
      ..writeByte(2)
      ..write(obj.modelID)
      ..writeByte(3)
      ..write(obj.modelName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
