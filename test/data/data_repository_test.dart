import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:vehicle_manufacturers/data/data_repository.dart';
import 'package:vehicle_manufacturers/data/data_api_provider.dart';
import 'package:vehicle_manufacturers/models/manufacturer_item_model.dart';
import 'package:vehicle_manufacturers/models/model_details_model.dart';
import 'package:vehicle_manufacturers/models/vehicle_types_model.dart';
import 'package:vehicle_manufacturers/utils/constants.dart';
import 'package:mockito/annotations.dart';
import 'data_repository_test.mocks.dart';

class MockDataRepository extends Mock implements DataApiProvider {
  Future<List<ManufacturerItemModel>> fetchManufacturerList() async {
    final manufacturerListTest = <ManufacturerItemModel>[
    const ManufacturerItemModel(mfrName: 'Manufacturer 1', country: 'USA', mfrID: 1, vehicleTypes: []),
    const ManufacturerItemModel(mfrName: 'Manufacturer 2', country: 'USA', mfrID: 2, vehicleTypes: []),
  ];
  return manufacturerListTest;
  }
}

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

@GenerateMocks([MockDataRepository])
void main() async {
  initHive();
  group('DataRepository tests', () {
    late DataRepository dataRepository;
    late MockDataRepository mockDataRepository;

    setUp(() async {
      await Hive.openBox('manufacturer_list');
      await Hive.openBox('model_details_list');
      dataRepository = DataRepository();
      mockDataRepository = MockMockDataRepository();
    });

    tearDown(() async {
      await Hive.openBox('manufacturer_list');
      await Hive.openBox('model_details_list');
      await Hive.box('manufacturer_list').clear();
      await Hive.box('model_details_list').clear();
      await Hive.close();
    });

    test('fetchManufacturerList should work correctly when there is no internet connection', () async {
      // arrange
      final expectedManufacturerList = [
        const ManufacturerItemModel(country: 'UNITED STATES (USA)', mfrID: 955, mfrName: 'TESLA, INC.', vehicleTypes: [
          VehicleTypesModel(isPrimary: true, name: "Passenger Car"),
        ])
      ];
      final box = await Hive.openBox('manufacturer_list');
      await box.put('mfr_list', expectedManufacturerList);

      // act
      final list = await dataRepository.fetchManufacturerList();

      // assert
      verifyZeroInteractions(mockDataRepository);
      expect(list[0].mfrID, equals(expectedManufacturerList[0].mfrID));

    });

    test('fetchModelList should work correctly when there is no internet connection and model is already in Hive',
        () async {
      // arrange
      const makerId = 479;
      final expectedModelDetailsList = [
        const ModelDetailsModel(
            makeID: makerId, modelName: 'Quest Manufacturing', makeName: 'Quest Manufacturing', modelID: 1885)
      ];
      final box = await Hive.openBox('model_details_list');
      await box.put('maker_$makerId', expectedModelDetailsList);

      // act
      final list = await dataRepository.fetchModelList(makerId);

      // assert
      verifyZeroInteractions(mockDataRepository);
      expect(list, equals(expectedModelDetailsList));
    });

    test('fetchModelList should work correctly when there is internet connection and model is not in Hive', () async {
      // arrange
      const makerId = 550;
      final expectedModelDetailsList = [
        const ModelDetailsModel(
            makeID: makerId, modelName: 'Supreme Corporation', makeName: 'Supreme Corporation', modelID: 2854)
      ];

      // act
      final list = await dataRepository.fetchModelList(makerId);

      // assert
      verifyNever(mockDataRepository.getDataFromNetwork('$modelsListURL$makerId$formatJson'));
      expect(list, equals(expectedModelDetailsList));
    });
  });
}
