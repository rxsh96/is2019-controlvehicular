import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:care_app/api/token/currentLogin.dart';
import 'package:care_app/api/token/showDialog.dart';
import 'dart:convert';
import 'package:care_app/models/loginModel.dart';

Future<LoginModel> requestLoginAPI(
    BuildContext context, String email, String password) async {
  final url = "http://192.168.0.152:8000/api/token/";

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
    saveLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/vehiculos');
    return LoginModel.fromJson(responseJson);
  }
  else {
    final responseJson = json.decode(response.body);

    saveLogin(responseJson);
    showSimpleDialog(
        context,
        "No es posible conectarse",
        "Email o contraseña inválidos, trata de nuevo.",
        "OK");
    return null;
  }
}
