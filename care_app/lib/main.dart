import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:care_app/src/pages/login_page.dart';
import 'package:care_app/src/pages/vehicle_page.dart';
import 'package:care_app/src/routes/routes.dart';

void main() async {

  final storage = new FlutterSecureStorage();
  String _token = await storage.read(key: 'token');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getRoutes(),

      //Tema general para el appbar
      theme: ThemeData(
        primaryColor: Color.fromRGBO(32, 32, 32, 1),
      ),
      home: _token == null ? LoginPage() : VehiclePage(),
    )
    
  
  );
}
