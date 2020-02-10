import 'dart:io';

import 'package:care_app/core/src/models/business_model.dart';
import 'package:care_app/core/src/models/item_model.dart';
import 'package:care_app/core/src/models/maintenance_detail_model.dart';
import 'package:care_app/core/src/models/maintenance_model.dart';
import 'package:care_app/core/src/models/my_guide_model.dart';
import 'package:care_app/core/src/models/my_maintenance_detail_model.dart';
import 'package:care_app/core/src/models/user_model.dart';
import 'package:care_app/core/src/models/vehicle_model.dart';
import 'package:care_app/core/src/repository/business_repository.dart';
import 'package:care_app/main.dart';
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

  List<ModelModel> _myModels;
  List<Vehicle> myVehicles;

  final List<dynamic> _vehiclesBrandsModelsList = <dynamic>[];

  List<ItemModel> _itemMaintenance = <ItemModel>[];

  Future<bool> fetchMaintenanceItems() async {
    _itemMaintenance = await _api.getMaintenanceItem();
    return _itemMaintenance != null;
  }

  Future<List<MaintenanceModel>> fetchMaintenanceGuide(int vehicleModel) async {
    return await _api.getMaintenanceGuide(vehicleModel: vehicleModel);
  }

  Future<List<MaintenanceDetailsModel>> fetchMaintenanceDetails(int vehicleID) async {
    return await _api.getMaintenanceDetails(vehicleID: vehicleID);
  }


  Future<List<MyGuideModel>> maintenanceGuide (int vehicleModel) async {
    final List<MaintenanceModel> guide = await fetchMaintenanceGuide(vehicleModel);
    final List<MyGuideModel> myGuide = <MyGuideModel>[];
    for (int i = 0 ; i < guide.length ; i++){
      for (int j = 0 ; j < _itemMaintenance.length ; j++){
        if(guide[i].mName == _itemMaintenance[j].id){
          myGuide.add(MyGuideModel(description: guide[i].description,
          km: guide[i].km, isChange: guide[i].isChange, isMaintenance: guide[i].isMaintenance,
          item: _itemMaintenance[j].item, kmToInspect: guide[i].kmToInspect, month: guide[i].month));
        }
      }
    }
    return myGuide;
  }

  Future<List<MyMaintenanceDetailModel>> maintenanceDetails (int vehicleID) async {
    final List<MaintenanceDetailsModel> maintenance = await fetchMaintenanceDetails(vehicleID);
    final List<MyMaintenanceDetailModel> myMaintenance = <MyMaintenanceDetailModel>[];
    final List<BusinessModel> business = locator<BusinessRepository>().business;
    MyMaintenanceDetailModel tmp = MyMaintenanceDetailModel();
    for (int i = 0 ; i < maintenance.length ; i++){
      tmp.date = maintenance[i].date;
      tmp.price = maintenance[i].price;
      tmp.km = maintenance[i].km;

      for (int j = 0 ; j < _itemMaintenance.length ; j++){
        if(maintenance[i].item == _itemMaintenance[j].id){
          tmp.item = _itemMaintenance[j].item;
        }
      }

      for(int j = 0 ; j < business.length ; j++){
        if(maintenance[i].local == business[j].id){
          tmp.localName = business[j].businessName;
        }
      }
      myMaintenance.add(tmp);
    }

    return myMaintenance;
  }



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

  List<ModelModel> get models => _models;
  List<BrandModel> get brands => _brands;
  List<dynamic> get vehiclesBrandsModelsList => _vehiclesBrandsModelsList;
  List<ItemModel> get itemMaintenance => _itemMaintenance;


  List<ModelModel> get myModel => _myModels;
  set myModels(List<ModelModel> value) {
    _myModels = value;
  }




}