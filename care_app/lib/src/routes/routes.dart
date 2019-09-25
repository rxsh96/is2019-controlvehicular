import 'package:flutter/material.dart';

import 'package:care_app/src/pages/add_filter_page.dart';
import 'package:care_app/src/pages/add_user_page.dart';
import 'package:care_app/src/pages/add_vehicle_page.dart';
import 'package:care_app/src/pages/brakes_page.dart';
import 'package:care_app/src/pages/filter_page.dart';
import 'package:care_app/src/pages/gasoline_page.dart';
import 'package:care_app/src/pages/kms_page.dart';
import 'package:care_app/src/pages/lights_page.dart';
import 'package:care_app/src/pages/login_page.dart';
import 'package:care_app/src/pages/transit_taxes_page.dart';
import 'package:care_app/src/pages/vehicle_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/login': (context) => LoginPage(),
    '/nuevoUser': (context) => AddUserPage(),
    '/vehiculos': (context) => VehiclePage(),
    '/agregarVehiculos': (context) => AddVehiclePage(),
    '/filtros': (context) => FilterPage(),
    '/frenos': (context) => BrakesPage(),
    '/luces': (context) => LigthsPage(),
    '/multas': (context) => TransitTaxesPage(),
    '/kilometraje': (context) => KmsPage(),
    '/gasolina': (context) => GasolinePage(),
    '/nuevoFiltro': (context) => AddFilterPage(),
  };
}
