import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/models/brand_model.dart';
import 'package:care_app/core/src/models/model_files.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:care_app/core/src/repository/vehicle_repository.dart';

import '../../locator.dart';
import 'base_provider.dart';

class VehicleProvider extends BaseProvider{

  final API _api = locator<API>();

  final VehicleRepository _vehicleRepository = locator<VehicleRepository>();

  Vehicle _selectedVehicle;
  List<Vehicle> _vehicles;

  Future<List<Vehicle>> fetchUserVehicles(User user) async{
    setState(ViewState.Busy);
    final List<Vehicle> vehicles = await _api.getUserVehicles(email: user.email);
    _vehicles = vehicles;
    setState(ViewState.Idle);
    notifyListeners();
    return vehicles;
  }

  Future<bool> saveVehicle(Vehicle vehicle) async{
    return await _vehicleRepository.addVehicle(vehicle);
  }


  Future<bool> fetchVehicleModels() async {
    return await _vehicleRepository.fetchVehicleModels();
  }

  Future<bool> fetchVehicleBrands() async {
    return await _vehicleRepository.fetchVehicleBrands();
  }


  void selectVehicle(Vehicle vehicle){
    _selectedVehicle = vehicle;
    notifyListeners();
  }

  List<Vehicle> get vehicles => _vehicles;
  Vehicle get selectedVehicle => _selectedVehicle;

  List<ModelModel> get models => _vehicleRepository.models;
  List<BrandModel> get brands => _vehicleRepository.brands;

}