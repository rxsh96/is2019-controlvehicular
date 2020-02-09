import 'dart:io';

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/models/brand_model.dart';
import 'package:care_app/core/src/models/item_model.dart';
import 'package:care_app/core/src/models/maintenance_model.dart';
import 'package:care_app/core/src/models/model_files.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:care_app/core/src/models/my_guide_model.dart';
import 'package:care_app/core/src/repository/vehicle_repository.dart';

import 'base_provider.dart';

class VehicleProvider extends BaseProvider{

  final API _api = locator<API>();

  final VehicleRepository _vehicleRepository = locator<VehicleRepository>();

  Vehicle _selectedVehicle;
  ModelModel _selectedModel;
  List<Vehicle> _vehicles;

  Future<List<Vehicle>> fetchUserVehicles(User user) async{
    setState(ViewState.Busy);
    final List<Vehicle> vehicles = await _api.getUserVehicles(owner: user.id);
    _vehicles = vehicles;
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

  void selectVehicle(Vehicle vehicle){
    _selectedVehicle = vehicle;
    notifyListeners();
  }

  void selectModel(ModelModel model){
    _selectedModel = model;
    notifyListeners();
  }




  List<Vehicle> get vehicles => _vehicles;
  Vehicle get selectedVehicle => _selectedVehicle;
  ModelModel get selectedModel => _selectedModel;

  List<ModelModel> get models => _vehicleRepository.models;
  List<BrandModel> get brands => _vehicleRepository.brands;

  List<ModelModel> get myModels => _vehicleRepository.myModel;


  List<dynamic> get brandsModels => _vehicleRepository.vehiclesBrandsModelsList;

}