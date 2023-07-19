import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_bloc.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_state.dart';
import 'package:vehicle_manufacturers/models/manufacturer_item_model.dart';
import 'package:vehicle_manufacturers/pages/widgets/manufacturer_list_page.dart';
import 'package:vehicle_manufacturers/utils/constants.dart';
import 'mfr_list_page_widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ManufacturerListBloc>()])
void main() {
  group('ManufacturerListPage', () {
    final List<ManufacturerItemModel> mfrListEmpty = [];

    final mockManufacturerListBloc = MockManufacturerListBloc();

    Widget widgetForTest() {
      return BlocProvider<ManufacturerListBloc>.value(
          value: mockManufacturerListBloc,
          child: const MaterialApp(
            home: Scaffold(body: ManufacturerListPage()),
          ));
    }

    testWidgets('renders CircularProgressIndicator on initial state', (WidgetTester tester) async {
      when(mockManufacturerListBloc.state).thenReturn(ManufacturerListInitialState());
      await tester.pumpWidget(widgetForTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      print('CIRCULAR PROGRESS INDICATOR SHOWN - OK');
    });

    testWidgets('renders ErrorWidgetWithButton on error state', (WidgetTester tester) async {
      await tester.pumpWidget(widgetForTest());
      when(mockManufacturerListBloc.state).thenReturn(ManufacturerListErrorState(errorLoadingData));
      await tester.pump();
      await expectLater(find.byKey(const Key(retryButtonKey)), findsOneWidget);
      print('BUTTON "TRY AGAIN" SHOWN - OK');
    });

    testWidgets('renders ManufacturerList on loaded state', (WidgetTester tester) async {
      await tester.pumpWidget(widgetForTest());
      when(mockManufacturerListBloc.state).thenReturn(ManufacturerListLoadedState(manufacturerList: mfrList));
      await tester.pump();
      await expectLater(find.byKey(const Key(mfrListKey)), findsOneWidget);
      print('MFR LIST SHOWN - OK');
    });

    testWidgets('renders ManufacturerList is empty', (WidgetTester tester) async {
      await tester.pumpWidget(widgetForTest());
      when(mockManufacturerListBloc.state).thenReturn(ManufacturerListLoadedState(manufacturerList: mfrListEmpty));
      await tester.pump();
      await expectLater(find.byKey(const Key(noDataLoaded), skipOffstage: false), findsOneWidget);
      print('NO DATA TEXT SHOWN - OK');
    });
  });
}
