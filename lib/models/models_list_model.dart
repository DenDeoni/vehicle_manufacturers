import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:quiver/core.dart';

import 'index.dart';

part 'models_list_model.g.dart';

@immutable
@HiveType(typeId: 3)
class ModelsListModel {

  const ModelsListModel({
    required this.count,
    required this.message,
    required this.searchCriteria,
    required this.results,
  });
  @HiveField(0)
  final int count;
  @HiveField(1)
  final String message;
  @HiveField(2)
  final String searchCriteria;
  @HiveField(3)
  final List<ModelDetailsModel> results;

  factory ModelsListModel.fromJson(Map<String,dynamic> json) => ModelsListModel(
    count: json['Count'] as int,
    message: json['Message'].toString(),
    searchCriteria: json['SearchCriteria'].toString(),
    results: (json['Results'] as List? ?? []).map((e) => ModelDetailsModel.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'Count': count,
    'Message': message,
    'SearchCriteria': searchCriteria,
    'Results': results.map((e) => e.toJson()).toList()
  };

  ModelsListModel clone() => ModelsListModel(
    count: count,
    message: message,
    searchCriteria: searchCriteria,
    results: results.map((e) => e.clone()).toList()
  );


  ModelsListModel copyWith({
    int? count,
    String? message,
    String? searchCriteria,
    List<ModelDetailsModel>? results
  }) => ModelsListModel(
    count: count ?? this.count,
    message: message ?? this.message,
    searchCriteria: searchCriteria ?? this.searchCriteria,
    results: results ?? this.results,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ModelsListModel && count == other.count && message == other.message && searchCriteria == other.searchCriteria && results == other.results;

  @override
  int get hashCode => count.hashCode ^ message.hashCode ^ searchCriteria.hashCode ^ results.hashCode;
}
