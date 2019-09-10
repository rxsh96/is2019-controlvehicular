import 'package:flutter/material.dart';
import 'package:care_app/src/routes/routes.dart';
import 'package:care_app/src/pages/splash_page.dart';
import 'package:care_app/src/pages/vehiculos_page.dart';
import 'package:care_app/src/pages/auth/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getRoutes(),

      //Tema general para el appbar
      theme: ThemeData(
        primaryColor: Color.fromRGBO(32, 32, 32, 1),
      ),
      home: MyLoginPage(),
    )
    
  
  );
}
