import 'package:flutter/material.dart';
import 'package:vehicle_manufacturers/@core/app_colors.dart';
import 'package:vehicle_manufacturers/@core/routing.dart';
import 'package:vehicle_manufacturers/models/manufacturer_item_model.dart';

class ManufacturerListItem extends StatelessWidget {
  final int index;
  final ManufacturerItemModel content;

  const ManufacturerListItem({Key? key, required this.index, required this.content}) : super(key: key);

  Color? _setItemColor(int index) {
    return index % 2 == 0 ? AppColors.background.backgroundGreen[50] : AppColors.background.backgroundWhite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Routing().navigateToManufacturerDetail(context, content);
      },
      child: Container(
        color: _setItemColor(index),
        child: ListTile(
          title: Text(content.mfrName),
          subtitle: Text(content.country),
        ),
      ),
    );
  }
}
