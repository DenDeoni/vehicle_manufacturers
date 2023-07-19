import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_bloc.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_event.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_state.dart';
import 'package:vehicle_manufacturers/models/manufacturer_item_model.dart';
import 'package:vehicle_manufacturers/models/model_details_model.dart';
import 'package:vehicle_manufacturers/models/vehicle_types_model.dart';
import 'package:vehicle_manufacturers/utils/constants.dart';

void initHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory? dir;

  dir = Directory.current;

  String path = dir.path;
  Hive.init(path);
  Hive.registerAdapter(ManufacturerItemModelAdapter());
  Hive.registerAdapter(ModelDetailsModelAdapter());
  Hive.registerAdapter(VehicleTypesModelAdapter());
}

void main() async {
  initHive();
  late ManufacturerListBloc manufacturerListBloc;

  setUp(() {
    manufacturerListBloc = ManufacturerListBloc();
  });

  tearDown(() {
    manufacturerListBloc.close();
  });

  group('ManufacturerListBloc', () {
    final mfrList = [
      const ManufacturerItemModel(mfrName: 'Manufacturer 1', country: 'USA', mfrID: 1, vehicleTypes: []),
      const ManufacturerItemModel(mfrName: 'Manufacturer 2', country: 'USA', mfrID: 2, vehicleTypes: []),
      const ManufacturerItemModel(mfrName: 'Manufacturer 3', country: 'USA', mfrID: 3, vehicleTypes: []),
    ];

    group('ManufacturerListLoadEvent', () {
      test('should emit [ManufacturerListLoadedState] when data loaded successfully and list is not empty', () {
        //arrange
        when(mfrList);
        //assert later
        final expected = [
          ManufacturerListLoadedState(manufacturerList: mfrList),
        ];
        expectLater(manufacturerListBloc.stream, emits(isA<ManufacturerListLoadedState>()));
        //act
        manufacturerListBloc.add(ManufacturerListLoadEvent());
      });

      test('should emit [ManufacturerListEndedState] when data loaded successfully and list is empty', () {
        //arrange
        when([]);
        //assert later
        final expected = [
          ManufacturerListEndedState(),
        ];
        expectLater(manufacturerListBloc.stream, emits(isA<ManufacturerListEndedState>()));
        //act
        manufacturerListBloc.add(ManufacturerListEndedEvent());
      });

      test('should emit [ManufacturerListErrorState] when error occurs during data loading', () {
        //arrange
        const tErrorMessage = 'Test Error Message';
        when(Exception(tErrorMessage));
        //assert later
        final expected = [
          ManufacturerListErrorState(errorLoadingData),
        ];
        expectLater(manufacturerListBloc.stream, emits(isA<ManufacturerListErrorState>()));
        //act
        manufacturerListBloc.add(ManufacturerListErrorEvent());
      });
    });
  });
}
