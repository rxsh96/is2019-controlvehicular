import 'dart:io';

import 'package:care_app/core/src/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/models/brand_model.dart';
import 'package:care_app/core/src/models/model_model.dart';

class VehicleRepository{

  final API _api = locator<API>();

  List<ModelModel> _models;
  List<BrandModel> _brands;
  final List<dynamic> _vehiclesBrandsModelsList = <dynamic>[];

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


  Future<bool> joinBrandModel() async{
    await fetchVehicleModels();
    await fetchVehicleBrands();
    for(int i = 0 ; i < _brands.length ; i++){
      final String brand = _brands[i].brand;
      final List<String> modelList = <String>[];
      for(int j = 0 ; j < _models.length ; j++){
        if(_brands[i].id == _models[j].brand){
          modelList.add(_models[j].model);
        }
      }
      final Map<dynamic, dynamic> tmp = <dynamic, dynamic>{'brand':brand, 'models':modelList};
      _vehiclesBrandsModelsList.add(tmp);
    }
    return _vehiclesBrandsModelsList != null;
  }



  Future<String> uploadVehicleImage(User user, File image) async {
    final StorageReference storageReference = FirebaseStorage.instance.ref().child('images/'+user.email+'/vehicle-pictures/${path.basename(image.path)}}');
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
    final String url = await downloadUrl.ref.getDownloadURL();
    return url;
  }

  //List<ModelModel> get models => _models;
  //List<BrandModel> get brands => _brands;
  List<dynamic> get vehiclesBrandsModelsList => _vehiclesBrandsModelsList;

}