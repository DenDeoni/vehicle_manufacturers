import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_manufacturers/bloc/manufacturer_list_bloc.dart';
import 'package:vehicle_manufacturers/pages/widgets/manufacturer_list_page.dart';
import 'package:vehicle_manufacturers/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManufacturerListBloc(),
      child: Scaffold(
        appBar: AppBar(

          centerTitle: true,
          title: const Text(vehicleManufacturers),
        ),
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Expanded(child: ManufacturerListPage()),
          ],
        ),
      ),
    );
  }
}
