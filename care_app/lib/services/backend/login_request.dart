import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:care_app/extras/show_dialog.dart';
import 'package:care_app/models/login_model.dart';

Future<LoginModel> requestLoginAPI(
    BuildContext context, String email, String password) async {
  const String url = 'http:// 172.20.134.89:8000/api/token/';
  const FlutterSecureStorage storage = FlutterSecureStorage();
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final Map<String, String> body =
  <String, String>{
    'email': email,
    'password': password,
  };

  final http.Response response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseJson = json.decode(response.body);
    storage.write(key: 'token', value: responseJson['token']);
    preferences.setString('email', body['email']);
    Navigator.of(context).pushReplacementNamed('/vehiculos');
    return LoginModel.fromJson(responseJson);
  } else {
    showSimpleDialog<String>(context, 'Ups', 'Credenciales Incorrectas.', 'OK');
    return null;
  }
}
