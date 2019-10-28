import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
      'http://192.168.0.152:8000/api/token/',
      body: body,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = json.decode(response.body);
      return responseJson['token'];
    }
    else{
      return null;
    }
  }




  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    //await Future<dynamic>.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
    //await Future<dynamic>.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final String myKey = await storage.read(key: 'token');
    return myKey != null;
  }
}