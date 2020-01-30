import 'dart:convert';

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
      return null;
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

/*Future<User> postUser({Map<String, String> user}) async {
    final  http.Response response = await getClient().post(ApiRoutes.BASE_URL + ApiRoutes.USERS, body: user);
    return compute(parseUser, response.body);
  }

  Future<String> getEmail() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('email');
  }

  Future<User> getUser() async {
    final String email = await getEmail();
    final http.Response response = await getClient().get(ApiRoutes.BASE_URL+ApiRoutes.USERS+'?email=$email');
    return compute(parseUser, response.body);
  }

  http.Client getClient(){
    return http.Client();
  }

  Future<List<Vehicle>> fetchVehicles() async {
    final User user = await getUser();
    final int id = user.id;
    final String url = ApiRoutes.BASE_URL+ApiRoutes.VEHICLES+'?owner=$id';
    final http.Response response = await getClient().get(url);
    if(response.statusCode == 200)
    return compute(parseVehicles, response.body);
  }


  Future<bool> postReset({Map<String, String> body}) async {
    final  http.Response response = await getClient().post(ApiRoutes.BASE_URL + ApiRoutes.RESET, body: body);
    return response.statusCode == 200;
}

  Future<Vehicle> postVehicle({Map<String, String> vehicle}) async {
    final  http.Response response = await getClient().post(ApiRoutes.BASE_URL + ApiRoutes.VEHICLES, body: vehicle);
    return compute(parseVehicle, response.body);
  }

  Future<ProfileImage> postImage({Map<String, String> img}) async{
    final  http.Response response = await getClient().post(ApiRoutes.BASE_URL + ApiRoutes.UPLOAD_PROFILE_IMG, body: img);
    return json.decode(response.body);
  }


}

List<Vehicle> parseVehicles(String responseBody) {
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Vehicle>((dynamic json) => Vehicle.fromJson(json)).toList();
}

Vehicle parseVehicle(String responseBody) {
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Vehicle>((dynamic json) => Vehicle.fromJson(json)).toList()[0];
}

User parseUser(String responseBody){
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<User>((dynamic json) => User.fromJson(json)).toList()[0];
}

ProfileImage parseImage(String responseBody){
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ProfileImage>((dynamic json) => ProfileImage.fromJson(json)).toList()[0];
}
*/
