import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_manufacturers/data/data_repository.dart';
import 'package:vehicle_manufacturers/models/manufacturer_item_model.dart';
import 'package:vehicle_manufacturers/utils/constants.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_event.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_state.dart';

class ManufacturerListBloc extends Bloc<ManufacturerListEvent, ManufacturerListState> with ChangeNotifier {
  final scrollController = ScrollController();
  bool isBottomReached = false;

  late final DataRepository _dataRepository = DataRepository();
  bool _endIsNotReached = true;

  ManufacturerListBloc() : super(ManufacturerListInitialState()) {
    print('BLOC');
    on<ManufacturerListLoadEvent>(
      (event, emit) async {
        print('LIST LOAD EVENT');
        List<ManufacturerItemModel> list = Platform.environment.containsKey('FLUTTER_TEST')
            ? mfrList
            : await _dataRepository.fetchManufacturerList();
        if (_endIsNotReached) {
          print('LIST: ${list.map((e) => e.mfrName)}');
          try {
            if (list.isEmpty) {
              _endIsNotReached = false;
            } else {
              emit(ManufacturerListLoadedState(
                manufacturerList: list,
              ));
            }
          } catch (e) {
            print('BLOC ERROR: $e');
            emit(ManufacturerListErrorState(errorLoadingData));
          }
        } else {
          emit(ManufacturerListEndedState());
        }
      },
    );
    on<ManufacturerListEndedEvent>(
      (event, emit) async {
        _endIsNotReached = false;
        emit(ManufacturerListEndedState());
      },
    );
    on<ManufacturerListErrorEvent>(
      (event, emit) async {
        print('LIST LOAD ERROR EVENT');
        emit(ManufacturerListErrorState(errorLoadingData));
      },
    );
  }
}
