// Mocks generated by Mockito 5.4.0 from annotations
// in vehicle_manufacturers/test/mfr_list_page_widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i8;

import 'package:flutter/material.dart' as _i2;
import 'package:flutter_bloc/flutter_bloc.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vehicle_manufacturers/bloc/manufacturer_list_bloc.dart' as _i4;
import 'package:vehicle_manufacturers/bloc/manufacturer_list_event.dart' as _i6;
import 'package:vehicle_manufacturers/bloc/manufacturer_list_state.dart' as _i3;

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

class _FakeScrollController_0 extends _i1.SmartFake
    implements _i2.ScrollController {
  _FakeScrollController_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeManufacturerListState_1 extends _i1.SmartFake
    implements _i3.ManufacturerListState {
  _FakeManufacturerListState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ManufacturerListBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockManufacturerListBloc extends _i1.Mock
    implements _i4.ManufacturerListBloc {
  @override
  _i2.ScrollController get scrollController => (super.noSuchMethod(
        Invocation.getter(#scrollController),
        returnValue: _FakeScrollController_0(
          this,
          Invocation.getter(#scrollController),
        ),
        returnValueForMissingStub: _FakeScrollController_0(
          this,
          Invocation.getter(#scrollController),
        ),
      ) as _i2.ScrollController);
  @override
  bool get isBottomReached => (super.noSuchMethod(
        Invocation.getter(#isBottomReached),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set isBottomReached(bool? _isBottomReached) => super.noSuchMethod(
        Invocation.setter(
          #isBottomReached,
          _isBottomReached,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.ManufacturerListState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeManufacturerListState_1(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeManufacturerListState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.ManufacturerListState);
  @override
  _i5.Stream<_i3.ManufacturerListState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i5.Stream<_i3.ManufacturerListState>.empty(),
        returnValueForMissingStub:
            _i5.Stream<_i3.ManufacturerListState>.empty(),
      ) as _i5.Stream<_i3.ManufacturerListState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i6.ManufacturerListEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i6.ManufacturerListEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i3.ManufacturerListState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i6.ManufacturerListEvent>(
    _i7.EventHandler<E, _i3.ManufacturerListState>? handler, {
    _i7.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i7.Transition<_i6.ManufacturerListEvent, _i3.ManufacturerListState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  void onChange(_i7.Change<_i3.ManufacturerListState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
