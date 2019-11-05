import 'package:flutter/material.dart';

import 'package:care_app/src/pages/add_filter_page.dart';
import 'package:care_app/src/pages/add_user_page.dart';
import 'package:care_app/src/pages/add_vehicle_page.dart';
import 'package:care_app/src/pages/brakes_page.dart';
import 'package:care_app/src/pages/filter_page.dart';
import 'package:care_app/src/pages/gasoline_page.dart';
import 'package:care_app/src/pages/kms_page.dart';
import 'package:care_app/src/pages/lights_page.dart';
import 'package:care_app/src/pages/my_profile_page.dart';
import 'package:care_app/src/pages/password_reset_page.dart';
import 'package:care_app/src/pages/transit_taxes_page.dart';
import 'package:care_app/src/pages/vehicle_page.dart';
import 'package:care_app/src/pages/map/gasolina_page.dart';
import 'package:care_app/src/pages/map/local_detail_page.dart';
import 'package:care_app/src/pages/map/locales_page.dart';
import 'package:care_app/src/pages/add_trip_page.dart';
import 'package:care_app/src/pages/trip_page.dart';
Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    //'/loginPage': (BuildContext context) => LoginPage(),
    '/addUserPage': (BuildContext context) => const AddUserPage(),
    '/resetPasswordPage': (BuildContext context) => PasswordResetPage(),
    '/myProfilePage': (BuildContext context) => MyProfilePage(),
    '/vehiclePage': (BuildContext context) =>  VehiclePage(),
    '/addVehiclePage': (BuildContext context) => const AddVehiclePage(),
    '/filterPage': (BuildContext context) => const FilterPage(),
    '/brakePage': (BuildContext context) => const BrakesPage(),
    '/lightPage': (BuildContext context) => LigthsPage(),
    '/transitTaxPage': (BuildContext context) => TransitTaxesPage(),
    '/kmPage': (BuildContext context) => KmsPage(),
    '/gasolinePage': (BuildContext context) => GasolinePage(),
    '/addFilterPage': (BuildContext context) => const AddFilterPage(),
    '/gasolinerasPage' : (BuildContext context ) => GasolinaPage(),
    '/localesPage'               : (BuildContext context ) => const LocalesPage(),
    '/localDetailPage'           : (BuildContext context ) => LocalDetailPage(),
    '/tripPage' : (BuildContext context ) => TripPage(),
    '/addTripPage' : (BuildContext context ) => AddTripPage(),
  };
}
