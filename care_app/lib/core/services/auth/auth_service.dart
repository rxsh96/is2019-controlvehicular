import 'dart:async';

import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/models/user_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';

class AuthenticationService{

  static final AuthenticationService instance = AuthenticationService();
  final API _api = locator<API>();

  Future<bool> authenticate({
    @required String email,
    @required String password}) async {
    final Map<String, dynamic> response = await _api.signInWithEmailAndPassword(email: email, password: password);
    if(response.containsKey('key')){
      persistToken(response['key']);
      persistEmail(email);
      return true;
    }
    return false;
  }

  Future<User> loadAuthUser() async{
    final String email = await getEmail();
    final User user = await _api.getUser(email: email);
    if(user != null){
      return user;
    }
    return null;
  }

  Future<User> loadAuthUserWithEmail({@required String email}) async {
    final User user = await _api.getUser(email: email);
    if(user != null){
      return user;
    }
    return null;
  }

  Future<void> persistToken(String token) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.write(key: 'key', value: token);
    return;
  }

  Future<void> deleteToken() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.delete(key: 'key');
    await storage.delete(key: 'email');
    return;
  }

  Future<bool> hasToken() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final String myKey = await storage.read(key: 'key');
    return myKey != null;
  }

  Future<void> persistEmail(String email) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email);
    return;
  }

  Future<String> getEmail() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String myEmail = preferences.get('email');
    if(myEmail != null) {
      return myEmail;
    }
    return null;
  }

}