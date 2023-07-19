// Mocks generated by Mockito 5.4.0 from annotations
// in vehicle_manufacturers/test/data/data_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:vehicle_manufacturers/models/manufacturer_item_model.dart'
    as _i4;

import 'data_repository_test.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MockDataRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockDataRepository extends _i1.Mock
    implements _i2.MockDataRepository {
  MockMockDataRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ManufacturerItemModel>> fetchManufacturerList() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchManufacturerList,
          [],
        ),
        returnValue: _i3.Future<List<_i4.ManufacturerItemModel>>.value(
            <_i4.ManufacturerItemModel>[]),
      ) as _i3.Future<List<_i4.ManufacturerItemModel>>);
  @override
  _i3.Future<Map<String, dynamic>> getDataFromNetwork(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDataFromNetwork,
          [url],
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);
}
