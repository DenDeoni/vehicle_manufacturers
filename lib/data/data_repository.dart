import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:vehicle_manufacturers/data/data_api_provider.dart';
import 'package:vehicle_manufacturers/models/manufacturer_item_model.dart';
import 'package:vehicle_manufacturers/models/manufacturer_list_model.dart';
import 'package:vehicle_manufacturers/models/model_details_model.dart';
import 'package:vehicle_manufacturers/models/models_list_model.dart';
import 'package:vehicle_manufacturers/utils/check_connect.dart';
import 'package:vehicle_manufacturers/utils/constants.dart';

class DataRepository {
  List<ManufacturerItemModel> _itemList = [];
  int _pageNumber = 0;

  Future<List<ManufacturerItemModel>> fetchManufacturerList() async {
    if (await _isConnect()) {
      _pageNumber++;
      final Map<String, dynamic> loadedData = await _retrieveData('$manufacturerListURL$_pageNumber');
      List<ManufacturerItemModel> list = ManufacturerListModel
          .fromJson(loadedData)
          .results;
      _itemList.addAll(list);
      await _saveMfrListToHive(_pageNumber, _itemList);
    } else {
      final List<ManufacturerItemModel> listFromHive = await _retrieveMfrListFromHive();
      if (_itemList.isEmpty || _itemList.length < listFromHive.length) {
        _itemList = await _retrieveMfrListFromHive();
      }
    }
    return _itemList;
  }

  Future<List<ModelDetailsModel>?> fetchModelList(final int makerId) async {
    List<ModelDetailsModel> list = [];
    if (await _isConnect() && !await _isModelListInHive(makerId)) {
      final Map<String, dynamic> loadedData = await _retrieveData('$modelsListURL$makerId$formatJson');
      list = ModelsListModel
          .fromJson(loadedData)
          .results;
      await _saveModelListToHive(makerId, list);
    } else {
      if (await _isModelListInHive(makerId)) {
        return _retrieveModelListFromHive(makerId);
      } else {
        return null;
      }
    }
    return list;
  }

  Future<bool> _isConnect() async {
    return Platform.environment.containsKey('FLUTTER_TEST') ? true : await CheckConnect().isInetConnect();
  }

  Future<Map<String, dynamic>> _retrieveData(final String url) async {
    final Map<String, dynamic> loadedData = await DataApiProvider().getDataFromNetwork(url);
    return loadedData;
  }

  Future<void> _saveMfrListToHive(int pageNumber, List<ManufacturerItemModel> list) async {
    final box = await Hive.openBox('manufacturer_list');
    await box.put('mfr_list', list);
    await box.close();
  }

  Future<void> _saveModelListToHive(int makerId, List<ModelDetailsModel> list) async {
    final box = await Hive.openBox('model_details_list');
    await box.put('maker_$makerId', list);
    await box.close();
  }

  Future<List<ManufacturerItemModel>> _retrieveMfrListFromHive() async {
    final box = await Hive.openBox('manufacturer_list');
    final list = (box.get('mfr_list') as List<dynamic>).cast<ManufacturerItemModel>();
    await box.close();
    return list;
  }

  Future<List<ModelDetailsModel>> _retrieveModelListFromHive(int makerId) async {
    final box = await Hive.openBox('model_details_list');
    final list = (box.get('maker_$makerId') as List<dynamic>).cast<ModelDetailsModel>();
    await box.close();
    return list;
  }

  Future<bool> _isModelListInHive(int makerId) async {
    final box = await Hive.openBox('model_details_list');
    bool isContains = box.containsKey('maker_$makerId');
    await box.close();
    return isContains;
  }
}
