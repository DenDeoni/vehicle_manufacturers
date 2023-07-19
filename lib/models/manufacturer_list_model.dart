import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:quiver/core.dart';

import 'index.dart';

part 'manufacturer_list_model.g.dart';

@immutable
@HiveType(typeId: 0)
class ManufacturerListModel {
  const ManufacturerListModel({
    required this.count,
    required this.message,
    this.searchCriteria,
    required this.results,
  });
  @HiveField(0)
  final int count;
  @HiveField(1)
  final String message;
  @HiveField(2)
  final dynamic? searchCriteria;
  @HiveField(3)
  final List<ManufacturerItemModel> results;

  factory ManufacturerListModel.fromJson(Map<String, dynamic> json) => ManufacturerListModel(
      count: json['Count'] is String ? int.parse(json['Count']) : json['Count'] as int,
      message: json['Message'].toString(),
      searchCriteria: json['SearchCriteria'] != null ? json['SearchCriteria'] as dynamic : null,
      results:
          (json['Results'] as List? ?? []).map((e) => ManufacturerItemModel.fromJson(e as Map<String, dynamic>)).toList());

  Map<String, dynamic> toJson() => {
        'Count': count,
        'Message': message,
        'SearchCriteria': searchCriteria,
        'Results': results.map((e) => e.toJson()).toList()
      };

  ManufacturerListModel clone() => ManufacturerListModel(
      count: count, message: message, searchCriteria: searchCriteria, results: results.map((e) => e.clone()).toList());

  ManufacturerListModel copyWith(
          {int? count, String? message, Optional<dynamic?>? searchCriteria, List<ManufacturerItemModel>? results}) =>
      ManufacturerListModel(
        count: count ?? this.count,
        message: message ?? this.message,
        searchCriteria: checkOptional(searchCriteria, () => this.searchCriteria),
        results: results ?? this.results,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ManufacturerListModel &&
          count == other.count &&
          message == other.message &&
          searchCriteria == other.searchCriteria &&
          results == other.results;

  @override
  int get hashCode => count.hashCode ^ message.hashCode ^ searchCriteria.hashCode ^ results.hashCode;
}
