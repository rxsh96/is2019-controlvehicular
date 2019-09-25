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
  final url = "http://192.168.0.152:8000/api/token/";
  final storage = new FlutterSecureStorage();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  Map<String, String> body = {
    'email': email,
    'password': password,
  };

  final response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    //AQUI GUARDAMOS EL DATO DEL TOKEN EN EL TELEFONO PARA EL INICIO DE SESION
    storage.write(key: 'token', value: responseJson['token']);
    preferences.setString("email", body['email']);
    Navigator.of(context).pushReplacementNamed('/vehiculos');
    return LoginModel.fromJson(responseJson);
  } else {
    showSimpleDialog(context, "Ups", "Credenciales Incorrectas.", "OK");
    return null;
  }
}
