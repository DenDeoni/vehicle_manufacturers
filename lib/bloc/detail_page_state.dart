import 'package:vehicle_manufacturers/models/model_details_model.dart';

abstract class DetailPageState {}

class DetailPageEmptyState extends DetailPageState {}

class DetailPageLoadingState extends DetailPageState {}

class DetailPageLoadedState extends DetailPageState {
  late final List<ModelDetailsModel>? modelList;

  DetailPageLoadedState({this.modelList});
}

class DetailPagErrorLoadState extends DetailPageState {}
