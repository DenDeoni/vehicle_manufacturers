import 'package:flutter/material.dart';
import 'package:vehicle_manufacturers/models/index.dart';
import 'package:vehicle_manufacturers/pages/manufacturer_detail_page.dart';

class Routing {
  static final Routing _instance = Routing._internal();

  factory Routing() {
    return _instance;
  }

  Routing._internal();

  void navigateToManufacturerDetail(BuildContext context, ManufacturerItemModel content) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ManufacturerDetailPage(
                content: content,
              )),
    );
  }
}
