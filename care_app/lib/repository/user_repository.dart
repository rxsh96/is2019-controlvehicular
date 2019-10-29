import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:care_app/services/backend/api_routes.dart';

class UserRepository {

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {

    final Map<String, String> body = <String, String>{
      'email': username,
      'password': password,
    };

    final http.Response response = await http.post(
      ApiRoutes.BASE_URL+ApiRoutes.TOKEN,
      body: body,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', body['email']);
      return responseJson['key'];
    }
    else{
      await Future<dynamic>.delayed(Duration(seconds: 1));
      return 'key';
    }
  }

  Future<void> deleteToken() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.delete(key: 'key');
    await Future<dynamic>.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.write(key: 'key', value: token);
    await Future<dynamic>.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final String myKey = await storage.read(key: 'key');
    await Future<dynamic>.delayed(Duration(seconds: 1));
    return myKey != null;
  }
}