import 'package:care_app/core/locator.dart';
import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/models/brand_model.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:care_app/core/src/models/vehicle_model.dart';

class VehicleRepository{

  final API _api = locator<API>();

  List<ModelModel> _models;
  List<BrandModel> _brands;

  Future<bool> addVehicle(Vehicle vehicle) async {
    final Map<String, dynamic> response = await _api.postVehicle(vehicle: vehicle);
    return !response.containsKey('error');
  }

  Future<bool> fetchVehicleModels() async {
    _models = await _api.getVehicleModels();
    return _models != null;
  }

  Future<bool> fetchVehicleBrands() async {
    _brands = await _api.getVehicleBrands();
    return _brands != null;
  }

  List<ModelModel> get models => _models;
  List<BrandModel> get brands => _brands;

}