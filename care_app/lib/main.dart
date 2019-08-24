import 'package:care_app/src/pages/filtros_page.dart';
import 'package:care_app/src/pages/agregarVehiculo_page.dart';
import 'package:care_app/src/pages/auth/login_page.dart';
import 'package:care_app/src/pages/frenos_page.dart';
import 'package:care_app/src/pages/gasolina_page.dart';
import 'package:care_app/src/pages/kms_page.dart';
import 'package:care_app/src/pages/luces_page.dart';
import 'package:care_app/src/pages/multas_page.dart';
import 'package:care_app/src/pages/nuevoUser_page.dart';
import 'package:care_app/src/pages/vehiculos_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
       home: MyApp(),
       debugShowCheckedModeBanner: false,
       initialRoute: '/',
      routes: {
        '/login'           : ( context ) => MyLoginPage(),
        '/nuevoUser'       : ( context ) => NuevoUserPage(),
        '/vehiculos'       : ( context ) => VehiculosPage(),
        '/agregarVehiculos': ( context ) => AgregarVehiculoPage(),
        '/filtros'         : ( context ) => FiltroPage(),
        '/frenos'          : ( context ) => FrenosPage(),
        '/luces'           : ( context ) => LucesPage(),
        '/multas'          : ( context ) => MultasPage(),
        '/kilometraje'     : ( context ) => KilometrajePage(),
        '/gasolina'        : ( context ) => GasolinaPage()
        
       },


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