import 'dart:io';

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/models/brand_model.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class VehicleRepository{

  final API _api = locator<API>();

  List<ModelModel> _models;
  List<BrandModel> _brands;

  Future<Map<String, dynamic>> addVehicle(Map<String, dynamic> vehicle) async {
    return await _api.postVehicle(vehicle: vehicle);
  }

  Future<bool> fetchVehicleModels() async {
    _models = await _api.getVehicleModels();
    return _models != null;
  }

  Future<bool> fetchVehicleBrands() async {
    _brands = await _api.getVehicleBrands();
    return _brands != null;
  }

  Future<String> uploadVehicleImage(File image) async {
    final StorageReference storageReference = FirebaseStorage.instance.ref().child('vehicle-pictures/${path.basename(image.path)}}');
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
    final String url = await downloadUrl.ref.getDownloadURL();
    return url;
  }

  List<ModelModel> get models => _models;
  List<BrandModel> get brands => _brands;

}