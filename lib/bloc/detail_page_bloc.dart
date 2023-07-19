import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_manufacturers/bloc/detail_page_bloc_event.dart';
import 'package:vehicle_manufacturers/bloc/detail_page_state.dart';
import 'package:vehicle_manufacturers/data/data_repository.dart';

class DetailPageBloc extends Bloc<DetailPageEvent, DetailPageState> {
  final int makerId;

  DetailPageBloc({required this.makerId}) : super(DetailPageEmptyState()) {
    on<DetailPageEvent>(
      (event, emit) async {
        emit(DetailPageLoadingState());
        try {
          final modelList = await DataRepository().fetchModelList(makerId);
          emit(DetailPageLoadedState(modelList: modelList));
        } catch (e) {
          log('ERROR: $e');
          emit(DetailPagErrorLoadState());
        }
      },
    );
  }
}
