import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:quiver/core.dart';

import 'index.dart';

part 'model_details_model.g.dart';

@immutable
@HiveType(typeId: 2)
class ModelDetailsModel {

  const ModelDetailsModel({
    required this.makeID,
    required this.makeName,
    required this.modelID,
    required this.modelName,
  });
  @HiveField(0)
  final int makeID;
  @HiveField(1)
  final String makeName;
  @HiveField(2)
  final int modelID;
  @HiveField(3)
  final String modelName;

  factory ModelDetailsModel.fromJson(Map<String,dynamic> json) => ModelDetailsModel(
    makeID: json['Make_ID'] as int,
    makeName: json['Make_Name'].toString(),
    modelID: json['Model_ID'] as int,
    modelName: json['Model_Name'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'Make_ID': makeID,
    'Make_Name': makeName,
    'Model_ID': modelID,
    'Model_Name': modelName
  };

  ModelDetailsModel clone() => ModelDetailsModel(
    makeID: makeID,
    makeName: makeName,
    modelID: modelID,
    modelName: modelName
  );


  ModelDetailsModel copyWith({
    int? makeID,
    String? makeName,
    int? modelID,
    String? modelName
  }) => ModelDetailsModel(
    makeID: makeID ?? this.makeID,
    makeName: makeName ?? this.makeName,
    modelID: modelID ?? this.modelID,
    modelName: modelName ?? this.modelName,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ModelDetailsModel && makeID == other.makeID && makeName == other.makeName && modelID == other.modelID && modelName == other.modelName;

  @override
  int get hashCode => makeID.hashCode ^ makeName.hashCode ^ modelID.hashCode ^ modelName.hashCode;
}
