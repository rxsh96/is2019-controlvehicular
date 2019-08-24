
import 'package:flutter/material.dart';

import 'package:care_app/src/pages/auth/login_page.dart';
import 'package:care_app/src/routes/routes.dart';


void main() {
  runApp(
    MaterialApp(
       home: MyApp(),
       debugShowCheckedModeBanner: false,
       initialRoute: '/',
      routes: getRoutes(),

      //Tema general para el appbar
      theme: ThemeData(
        primaryColor: Color.fromRGBO(32, 32, 32, 1),
      ),
    )
    
  
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    Future.delayed(
      Duration(seconds: 3 ),
      (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:(context)=> MyLoginPage(),           
          ),          
        );
        
      
      }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        image: AssetImage('images/fondo splash-01.png'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center
      )

    );
      
  }
}