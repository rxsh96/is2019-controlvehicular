import 'dart:convert';

import 'package:care_app/core/src/models/item_model.dart';
import 'package:care_app/core/src/models/maintenance_detail_model.dart';
import 'package:care_app/core/src/models/maintenance_model.dart';
import 'package:flutter/foundation.dart';

import 'package:care_app/core/src/models/model_files.dart';

import 'api_files.dart';

class API {
  final ApiHelper _apiHelper = ApiHelper();

  ///[JsonDecoder] to decode JSON Responses
  final JsonDecoder _decoder = const JsonDecoder();

  ///Function to validate if [User] credentials are correct and Sign in.
  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      {@required String email, @required String password}) async {

    final Map<String, dynamic> data = <String, dynamic>{
      'email': email,
      'password': password,
    };

    final MyResponse response = await _apiHelper.post<Map<String, dynamic>>(
        data: data, endPoint: ApiRoutes.TOKEN);
    if (response.isSuccess) {
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }


  ///Function that returns [User] information from backend.
  Future<User> getUser({@required String email}) async {
    final MyResponse response = await _apiHelper.get<User>(endPoint: ApiRoutes.USERS, queryParam: '?email=$email');
    if(response.isSuccess){
      final List<dynamic> jsonUser = _decoder.convert(response.result.toString());
      if(jsonUser.isNotEmpty){
        return User.fromJson(jsonUser[0]);
      }
      return null;
    }
    return null;
  }

  ///Function that returns [List<Vehicle>] of the [User]
  Future<List<Vehicle>> getUserVehicles({@required int owner}) async {
    final MyResponse response = await _apiHelper.get<Vehicle>(endPoint: ApiRoutes.VEHICLES, queryParam: '?owner=$owner');
    if(response.isSuccess){
      final String vehicleResponse = response.result.toString();
      return compute(parseVehicles, vehicleResponse);
    }
    return null;
  }

  Future<ProfileImageModel> getProfilePicURL({@required int id}) async {
    final MyResponse response = await _apiHelper.get<ProfileImageModel>(endPoint: ApiRoutes.UPLOAD_PROFILE_IMG, queryParam: '?user=$id');
    if(response.isSuccess){
      final List<dynamic> jsonUser = _decoder.convert(response.result.toString());
      if(jsonUser.isNotEmpty){
        return ProfileImageModel.fromJson(jsonUser[0]);
      }
    }
    return ProfileImageModel(file: 'images/user_avatar.png', user: 0);
  }

  Future<List<MaintenanceModel>> getMaintenanceGuide({@required int vehicleModel}) async {
    final MyResponse response = await _apiHelper.get<MaintenanceModel>(endPoint: ApiRoutes.MAINTENANCE,
        queryParam: '?model=$vehicleModel&ordering=km');
    if(response.isSuccess){
      final String maintenanceResponse = response.result.toString();
      if(maintenanceResponse.isNotEmpty){
        return compute(parseMaintenance, maintenanceResponse);
      }
    }
    return null;
  }

  Future<List<ItemModel>> getMaintenanceItem() async {
    final MyResponse response = await _apiHelper.get<MaintenanceModel>(endPoint: ApiRoutes.MAINTENANCE_ITEMS);
    if(response.isSuccess){
      final String maintenanceItemsResponse = response.result.toString();
      if(maintenanceItemsResponse.isNotEmpty){
        return compute(parseMaintenanceItem, maintenanceItemsResponse);
      }
    }
    return null;
  }

  Future<List<MaintenanceDetailsModel>> getMaintenanceDetails({@required int vehicleID}) async {
    final MyResponse response = await _apiHelper.get<MaintenanceModel>(endPoint: ApiRoutes.MAINTENANCE_DETAILS, queryParam: '?vehicle=$vehicleID');
    if(response.isSuccess){
      final String maintenanceDetailsResponse = response.result.toString();
      if(maintenanceDetailsResponse.isNotEmpty){
        return compute(parseMaintenanceDetails, maintenanceDetailsResponse);
      }
    }
    return null;
  }


  Future<Map<String, dynamic>> postUser({@required Map<String, dynamic> user}) async {
    final MyResponse response = await _apiHelper.post<User>(endPoint: ApiRoutes.USERS, data: user);
    if(response.isSuccess){
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }


  Future<Map<String, dynamic>> postMaintenance({@required Map<String, dynamic> maintenance}) async {
    final MyResponse response = await _apiHelper.post<MaintenanceModel>(endPoint: ApiRoutes.MAINTENANCE_DETAILS, data: maintenance);
    if(response.isSuccess){
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }



  Future<Map<String, dynamic>> postAccident({@required Map<String, dynamic> data}) async {
    final MyResponse response = await _apiHelper.post<User>(endPoint: ApiRoutes.ACCIDENTS, data: data);
    if(response.isSuccess){
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }

  Future<Map<String, dynamic>> postPasswordReset({Map<String, String> data}) async {
    final  MyResponse response = await _apiHelper.post<dynamic>(endPoint: ApiRoutes.RESET, data: data);
    if(response.isSuccess){
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }

  Future<Map<String, dynamic>> postProfilePic({@required Map<String, dynamic> image}) async {
    final MyResponse response = await _apiHelper.post<ProfileImageModel>(endPoint: ApiRoutes.UPLOAD_PROFILE_IMG, data: image);
    if(response.isSuccess){
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }

  Future<Map<String, dynamic>> postVehicle({@required Map<String, dynamic> vehicle}) async {
    final MyResponse response = await _apiHelper.post<Map<String, dynamic>>(endPoint: ApiRoutes.VEHICLES, data: vehicle);
    if (response.isSuccess) {
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }

  Future<DeviceModel> getFCMDevice({@required String deviceID}) async {
    final MyResponse response = await _apiHelper.get<DeviceModel>(endPoint: ApiRoutes.DEVICE, queryParam: '?device_id=$deviceID');
    if(response.isSuccess){
      final List<dynamic> jsonDevice = _decoder.convert(response.result.toString());
      if(jsonDevice.isNotEmpty){
        return DeviceModel.fromJson(jsonDevice[0]);
      }
    }
    return null;
  }

  Future<Map<String, dynamic>> postFCMDevice({@required DeviceModel deviceInformation}) async {
    final Map<String, dynamic> data = deviceInformation.toJson();
    final MyResponse response = await _apiHelper.post<DeviceModel>(endPoint: ApiRoutes.DEVICE, data: data);
    if (response.isSuccess) {
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }

  Future<Map<String, dynamic>> putFCMDevice({@required DeviceModel deviceInformation, String registrationToken}) async {
    final Map<String, dynamic> data = deviceInformation.toJson();
    final MyResponse response = await _apiHelper.patch<DeviceModel>(endPoint: ApiRoutes.DEVICE, instance: registrationToken, data: data);
    if (response.isSuccess) {
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }

  Future<Map<String, dynamic>> putKm({@required String vehicleID, Map<String, dynamic> data}) async {
    final MyResponse response = await _apiHelper.patch(endPoint: ApiRoutes.VEHICLES, instance: vehicleID, data: data);
    if (response.isSuccess) {
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }

  
  Future<List<ModelModel>> getVehicleModels() async{
    final MyResponse response = await _apiHelper.get<ModelModel>(endPoint: ApiRoutes.MODELS);
    if(response.isSuccess){
      final String modelResponse = response.result.toString();
      return compute(parseModels, modelResponse);
    }
    return null;
  }

  Future<List<BrandModel>> getVehicleBrands() async{
    final MyResponse response = await _apiHelper.get<ModelModel>(endPoint: ApiRoutes.BRANDS);
    if(response.isSuccess){
      final String brandResponse = response.result.toString();
      return compute(parseBrands, brandResponse);
    }
    return null;
  }

    Future<List<BusinessModel>> getBusiness() async{
    final MyResponse response = await _apiHelper.get<BusinessModel>(endPoint: ApiRoutes.BUSINESS);
    if(response.isSuccess){
      final String businessResponse = response.result.toString();
      return compute(parseBusiness, businessResponse);
    }
    return null;
  }

  Future<Map<String, dynamic>> postComments({Map<String, String> data}) async {
    final  MyResponse response = await _apiHelper.post<dynamic>(endPoint: ApiRoutes.SUGGESTIONS, data: data);
    if(response.isSuccess){
      return _decoder.convert(response.result);
    }
    return <String, dynamic>{'error': 'error'};
  }

}

List<Vehicle> parseVehicles(String responseBody) {
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Vehicle>((dynamic json) => Vehicle.fromJson(json)).toList();
}

List<ModelModel> parseModels(String responseBody){
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ModelModel>((dynamic json) => ModelModel.fromJson(json)).toList();
}

List<BrandModel> parseBrands(String responseBody){
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<BrandModel>((dynamic json) => BrandModel.fromJson(json)).toList();
}

List<BusinessModel> parseBusiness(String responseBody){
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<BusinessModel>((dynamic json) => BusinessModel.fromJson(json)).toList();
}

List<MaintenanceModel> parseMaintenance(String responseBody){
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<MaintenanceModel>((dynamic json) => MaintenanceModel.fromJson(json)).toList();
}

List<ItemModel> parseMaintenanceItem(String responseBody){
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ItemModel>((dynamic json) => ItemModel.fromJson(json)).toList();
}

List<MaintenanceDetailsModel> parseMaintenanceDetails(String responseBody){
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<MaintenanceDetailsModel>((dynamic json) => MaintenanceDetailsModel.fromJson(json)).toList();
}


