import 'package:flutter/material.dart';
import 'package:vehicle_manufacturers/models/manufacturer_item_model.dart';
import 'package:vehicle_manufacturers/pages/widgets/manufacturer_list_item.dart';

class ManufacturerList extends StatelessWidget {
  final List<ManufacturerItemModel> manufacturerList;
  final Function onScrollEnd;
  final ScrollController controller;

  const ManufacturerList({
    super.key,
    required this.manufacturerList,
    required this.onScrollEnd,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: manufacturerList.length,
        itemBuilder: (context, index) {
          if (index == manufacturerList.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return ManufacturerListItem(
            index: index,
            content: manufacturerList[index],
          );
        },
        controller: controller,
      ),
    );
  }
}
