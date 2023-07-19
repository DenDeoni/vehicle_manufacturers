import 'package:flutter/material.dart';
import 'package:vehicle_manufacturers/models/model_details_model.dart';

class ModelListItem extends StatelessWidget {
  int index;
  List<ModelDetailsModel> modelList;
  ModelListItem({required this.modelList, required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(modelList[index].modelName),
          );
  }
}