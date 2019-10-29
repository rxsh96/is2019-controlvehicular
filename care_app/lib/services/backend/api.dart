import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:care_app/services/backend/api_routes.dart';
import 'package:care_app/models/image_model.dart';
import 'package:care_app/models/user_model.dart';
import 'package:care_app/models/vehicle_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class API {

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

  Future<User> postUser({Map<String, String> user}) async {
    final  http.Response response = await getClient().post(ApiRoutes.BASE_URL + ApiRoutes.USERS, body: user);
    return compute(parseUser, response.body);
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

