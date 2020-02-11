import 'dart:io';

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/models/brand_model.dart';
import 'package:care_app/core/src/models/item_model.dart';
import 'package:care_app/core/src/models/model_files.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:care_app/core/src/models/my_guide_model.dart';
import 'package:care_app/core/src/models/my_maintenance_detail_model.dart';
import 'package:care_app/core/src/repository/vehicle_repository.dart';

import 'base_provider.dart';

class VehicleProvider extends BaseProvider{

  final API _api = locator<API>();

  final VehicleRepository _vehicleRepository = locator<VehicleRepository>();

  Vehicle _selectedVehicle;
  ModelModel _selectedModel;
  ItemModel _selectedItem;
  BusinessModel _selectedBusiness;
  List<Vehicle> _vehicles;

  Future<List<Vehicle>> fetchUserVehicles(User user) async{
    setState(ViewState.Busy);
    final List<Vehicle> vehicles = await _api.getUserVehicles(owner: user.id);
    _vehicleRepository.myVehicles = vehicles;
    setState(ViewState.Idle);
    notifyListeners();
    return vehicles;
  }

  Future<void> loadMyModels(User user) async {
    setState(ViewState.Busy);
    final List<Vehicle> vehicles = await _api.getUserVehicles(owner: user.id);
    final List<ModelModel> myModels = <ModelModel>[];
    for(Vehicle v in vehicles){
      for(ModelModel mm in _vehicleRepository.models){
        if(v.model == mm.id){
          myModels.add(mm);
        }
      }
    }
    _vehicleRepository.myModels = myModels;
    setState(ViewState.Idle);
  }

  Future<List<MyGuideModel>> fetchMaintenanceGuide(int vehicleModel) async {
    setState(ViewState.Busy);
    final List<MyGuideModel> maintenanceGuide = await _vehicleRepository.maintenanceGuide(vehicleModel);
    setState(ViewState.Idle);
    return maintenanceGuide;
  }

  Future<List<MyMaintenanceDetailModel>> fetchMaintenanceDetails(int vehicleModel) async {
    setState(ViewState.Busy);
    final List<MyMaintenanceDetailModel> maintenanceDetails = await _vehicleRepository.maintenanceDetails(vehicleModel);
    setState(ViewState.Idle);
    return maintenanceDetails;
  }

  Future<Map<String, dynamic>>  postExpense (Map<String, dynamic> expense) async{
    setState(ViewState.Busy);
    final Map<String, dynamic> response = await _vehicleRepository.postExpense(expense);
    setState(ViewState.Idle);
    return response;
  }


  Future<void> fetchMaintenanceItem() async {
    setState(ViewState.Busy);
    await _vehicleRepository.fetchMaintenanceItems();
    setState(ViewState.Idle);
  }


  Future<Map<String, dynamic>> saveVehicle(Map<String, dynamic> vehicle) async{
    setState(ViewState.Busy);
    final Map<String, dynamic> response = await _vehicleRepository.addVehicle(vehicle);
    setState(ViewState.Idle);
    return response;
  }

  Future<Map<String, dynamic>> registerMaintenance(Map<String, dynamic> maintenance) async{
    setState(ViewState.Busy);
    final Map<String, dynamic> response = await _vehicleRepository.registerMaintenance(maintenance);
    setState(ViewState.Idle);
    return response;
  }

  Future<Map<String, dynamic>>  registerTrip(Map<String, dynamic> data) async {
    setState(ViewState.Busy);
    final Map<String, dynamic> response = await _vehicleRepository.registerTrip(data);
    setState(ViewState.Idle);
    return response;
  }


  Future<Map<String, dynamic>> updateKm(int vehicleID, Map<String, dynamic> data) async {
    setState(ViewState.Busy);
    final Map<String, dynamic> response = await _vehicleRepository.updateKm(vehicleID, data);
    setState(ViewState.Idle);
    return response;
  }

  Future<String> saveVehiclePic(User user, File image) async {
    setState(ViewState.Busy);
    final String response = await _vehicleRepository.uploadVehicleImage(user, image);
    setState(ViewState.Idle);
    return response;
  }

  Future<void> fetchVehicleModels() async {
    setState(ViewState.Busy);
    await _vehicleRepository.fetchVehicleModels();
    setState(ViewState.Idle);
  }

  Future<void> fetchVehicleBrands() async {
    setState(ViewState.Busy);
    await _vehicleRepository.fetchVehicleBrands();
    setState(ViewState.Idle);
  }

  Future<void> fetchVehicleBrandsModels() async {
    setState(ViewState.Busy);
    await _vehicleRepository.joinBrandModel();
    setState(ViewState.Idle);
  }

//  void selectVehicle(Vehicle vehicle){
//    _selectedVehicle = vehicle;
//    notifyListeners();
//  }

  void selectItem(ItemModel item){
    _selectedItem = item;
    notifyListeners();
  }

  void selectModel(ModelModel model){
    _selectedModel = model;
    notifyListeners();
    for(Vehicle v in _vehicleRepository.myVehicles){
      if(model.id == v.model){
        _selectedVehicle = v;
        notifyListeners();
      }
    }
  }

  void selectBusiness(BusinessModel business){
    _selectedBusiness = business;
    notifyListeners();
  }



  //List<Vehicle> get vehicles => _vehicles;
  Vehicle get selectedVehicle => _selectedVehicle;
  ModelModel get selectedModel => _selectedModel;
  ItemModel get selectedItem => _selectedItem;
  BusinessModel get selectedBusiness => _selectedBusiness;

  List<ModelModel> get models => _vehicleRepository.models;
  List<BrandModel> get brands => _vehicleRepository.brands;

  List<ModelModel> get myModels => _vehicleRepository.myModel;
  List<ItemModel> get items => _vehicleRepository.itemMaintenance;


  List<dynamic> get brandsModels => _vehicleRepository.vehiclesBrandsModelsList;



}