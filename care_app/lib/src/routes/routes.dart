import 'package:flutter/material.dart';

import 'package:care_app/src/pages/agregarVehiculo_page.dart';
import 'package:care_app/src/pages/login_page.dart';
import 'package:care_app/src/pages/filtros_page.dart';
import 'package:care_app/src/pages/frenos_page.dart';
import 'package:care_app/src/pages/gasolina_page.dart';
import 'package:care_app/src/pages/kms_page.dart';
import 'package:care_app/src/pages/luces_page.dart';
import 'package:care_app/src/pages/multas_page.dart';
import 'package:care_app/src/pages/nuevoUser_page.dart';
import 'package:care_app/src/pages/vehiculos_page.dart';
import 'package:care_app/src/pages/nuevoFiltro_page.dart';



Map <String , WidgetBuilder > getRoutes(){

  return <String, WidgetBuilder>{
        '/login'           : ( context ) => MyLoginPage(),
        '/nuevoUser'       : ( context ) => NuevoUserPage(),
        '/vehiculos'       : ( context ) => VehiculosPage(),
        '/agregarVehiculos': ( context ) => AgregarVehiculoPage(),
        '/filtros'         : ( context ) => FiltroPage(),
        '/frenos'          : ( context ) => FrenosPage(),
        '/luces'           : ( context ) => LucesPage(),
        '/multas'          : ( context ) => MultasPage(),
        '/kilometraje'     : ( context ) => KilometrajePage(),
        '/gasolina'        : ( context ) => GasolinaPage(),
        '/nuevoFiltro'     : ( context ) => NuevoFiltro(),
      
  };
}
