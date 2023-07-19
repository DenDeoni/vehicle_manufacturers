import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_bloc.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_event.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_state.dart';
import 'package:vehicle_manufacturers/pages/widgets/error_widget.dart';
import 'package:vehicle_manufacturers/pages/widgets/manufacturer_list.dart';
import 'package:vehicle_manufacturers/utils/check_connect.dart';
import 'package:vehicle_manufacturers/utils/constants.dart';

class ManufacturerListPage extends StatelessWidget {
  const ManufacturerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ManufacturerListBloc(),
      child: BlocBuilder<ManufacturerListBloc, ManufacturerListState>(
        builder: (context, state) {
          final manufacturerListBloc = BlocProvider.of<ManufacturerListBloc>(context);
          if (state is ManufacturerListInitialState) {
            manufacturerListBloc.add(ManufacturerListLoadEvent());
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ManufacturerListErrorState) {
            return Center(
              child: ErrorWidgetWithButton(
                message: errorLoadingData,
                onRetry: () => manufacturerListBloc.add(ManufacturerListLoadEvent()),
              ),
            );
          }
          if (state is ManufacturerListLoadedState) {
            return state.manufacturerList.isEmpty
                ? const Center(
                    child: Text(
                      key: Key(noDataLoadedKey),
                      noDataLoaded,
                    ),
                  )
                : ManufacturerList(
                    key: const Key(mfrListKey),
                    manufacturerList: state.manufacturerList,
                    onScrollEnd: () => _handleScrollEnd(context, manufacturerListBloc),
                    controller: manufacturerListBloc.scrollController,
                  );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _handleScrollEnd(BuildContext context, ManufacturerListBloc bloc) async {
    if (bloc.scrollController.position.pixels == bloc.scrollController.position.maxScrollExtent &&
        !bloc.isBottomReached) {
      bloc.isBottomReached = true;
      bloc.add(ManufacturerListLoadEvent());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: await CheckConnect().isInetConnect() ? const Text(nextPageLoading) : const Text(checkInternet),
        duration: const Duration(seconds: 1),
      ));
    } else {
      bloc.isBottomReached = false;
    }
  }
}
