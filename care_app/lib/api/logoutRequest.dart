import 'dart:_http';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:care_app/api/token/getToken.dart';
import 'package:care_app/api/token/currentLogin.dart';
import 'package:care_app/models/loginModel.dart';

Future<LoginModel> requestLogoutAPI(BuildContext context) async {
  final url = "http://127.0.0.1:8000/api/token/";

  var token;

  await getToken().then((result) {
    token = result;
  });

  final response = await http.post(
    url,
    headers: {HttpHeaders.authorizationHeader: "Token $token"},
  );

  if (response.statusCode == 200) {
    saveLogout();
    return null;
  } else {
    saveLogout();
    return null;
  }
}