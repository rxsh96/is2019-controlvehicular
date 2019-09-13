import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:care_app/Extras/showDialog.dart';
import 'dart:convert';
import 'package:care_app/models/loginModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<LoginModel> requestLoginAPI(

BuildContext context, String email, String password) async {
  final url = "http://192.168.100.178:8000/api/token/";
  final storage = new FlutterSecureStorage();

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
    Navigator.of(context).pushReplacementNamed('/vehiculos');
    return LoginModel.fromJson(responseJson);
  }
  else {
    showSimpleDialog(
        context,
        "Ups",
        "Credenciales Incorrectas.",
        "OK");
    return null;
  }
}
