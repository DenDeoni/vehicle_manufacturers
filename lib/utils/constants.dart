import '../models/manufacturer_item_model.dart';

const String vehicleManufacturers = 'Vehicle Manufacturers';
const String vehicleManufacturersDetail = 'Vehicle Manufacturers detail';
const String manufacturerListURL = 'https://vpic.nhtsa.dot.gov/api/vehicles/getallmanufacturers?format=json&page=';
const String modelsListURL = 'https://vpic.nhtsa.dot.gov/api/vehicles/GetModelsForMakeId/';
const String formatJson = '?format=json';
const String models = 'Models:';
const String failedRequest ='failed request';
const String errorLoadingData = 'Error loading data';
const String noDataPressLoad = 'No data received. Please button "Load"';
const String entireSheetLoaded = 'The entire Sheet is loaded';
const String noDataLoaded = 'No Data Loaded';
const String noDataSaved = 'No Data Saved';
const String nextPageLoading = 'Next Page loading...';
const String checkInternet = 'Check Internet connection';
const String tryAgain = 'Try again';
const String noDataLoadedKey = 'noDataLoadedKey';
const String retryButtonKey = 'retryButton';
const String mfrListKey = 'mfrListKey';
const List<ManufacturerItemModel> mfrList = [
  ManufacturerItemModel(mfrName: 'Manufacturer 1', country: 'USA', mfrID: 1, vehicleTypes: []),
  ManufacturerItemModel(mfrName: 'Manufacturer 2', country: 'USA', mfrID: 2, vehicleTypes: []),
  ManufacturerItemModel(mfrName: 'Manufacturer 3', country: 'USA', mfrID: 3, vehicleTypes: []),
];