import 'package:vehicle_manufacturers/models/manufacturer_item_model.dart';

abstract class ManufacturerListState {}

class ManufacturerListInitialState extends ManufacturerListState {}

class ManufacturerListLoadingState extends ManufacturerListState {}

class ManufacturerListLoadedState extends ManufacturerListState {
  late List<ManufacturerItemModel> manufacturerList;

  ManufacturerListLoadedState({required this.manufacturerList});
}

class ManufacturerListErrorState extends ManufacturerListState {
  final String error;
  ManufacturerListErrorState(this.error);
}

class ManufacturerListEndedState extends ManufacturerListState {}
