import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_manufacturers/@core/app_colors.dart';
import 'package:vehicle_manufacturers/bloc/detail_page_bloc.dart';
import 'package:vehicle_manufacturers/bloc/detail_page_bloc_event.dart';
import 'package:vehicle_manufacturers/bloc/detail_page_state.dart';
import 'package:vehicle_manufacturers/models/index.dart';
import 'package:vehicle_manufacturers/utils/constants.dart';
import 'package:vehicle_manufacturers/pages/widgets/model_list_item.dart';

class ManufacturerDetailPage extends StatelessWidget {
  final ManufacturerItemModel content;

  const ManufacturerDetailPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailPageBloc(makerId: content.mfrID)..add(DetailPagOpenedEvent()),
      child: _ManufacturerDetailPageContent(content: content),
    );
  }
}

class _ManufacturerDetailPageContent extends StatelessWidget {
  final ManufacturerItemModel content;

  const _ManufacturerDetailPageContent({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(vehicleManufacturersDetail),
      ),
      body: BlocConsumer<DetailPageBloc, DetailPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is DetailPageLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DetailPagErrorLoadState) {
            return const Center(child: Text(noDataSaved));
          }
          if (state is DetailPageLoadedState) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 25, right: 20, bottom: 10),
                  child: Center(
                    child: Text(
                      content.mfrName,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(models.toUpperCase()),
                      ),
                      // MODEL LIST
                      state.modelList != null
                          ? Expanded(
                              child: Scrollbar(
                                child: ListView.builder(
                                  itemCount: state.modelList!.length,
                                  itemBuilder: (context, index) =>
                                      ModelListItem(modelList: state.modelList!, index: index),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                noDataSaved,
                                style: TextStyle(fontSize: 20, color: AppColors.fonts.grey),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
