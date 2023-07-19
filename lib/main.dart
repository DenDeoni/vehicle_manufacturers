import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vehicle_manufacturers/@core/app_colors.dart';
import 'package:vehicle_manufacturers/models/manufacturer_item_model.dart';
import 'package:vehicle_manufacturers/models/manufacturer_list_model.dart';
import 'package:vehicle_manufacturers/models/model_details_model.dart';
import 'package:vehicle_manufacturers/models/models_list_model.dart';
import 'package:vehicle_manufacturers/models/vehicle_types_model.dart';
import 'package:vehicle_manufacturers/pages/home_page.dart';

void main() async{

  await Hive.initFlutter();
  Hive.registerAdapter(ManufacturerItemModelAdapter());
  Hive.registerAdapter(VehicleTypesModelAdapter());
  Hive.registerAdapter(ModelsListModelAdapter());
  Hive.registerAdapter(ModelDetailsModelAdapter());
  Hive.registerAdapter(ManufacturerListModelAdapter());
  await Hive.openBox('manufacturer_list');
  await Hive.openBox('model_details_list');
  runApp( const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Job',
      theme: ThemeData(
        primarySwatch: AppColors.background.backgroundGreen,
      ),
      home: const HomePage(),
    );
  }
}