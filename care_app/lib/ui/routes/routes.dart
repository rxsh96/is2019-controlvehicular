
import 'package:care_app/core/src/models/user_model.dart';
import 'package:care_app/ui/pages/add_user_page.dart';
import 'package:care_app/ui/pages/add_vehicle_page.dart';
import 'package:care_app/ui/pages/filter_page.dart';
import 'package:care_app/ui/pages/login_page.dart';
import 'package:care_app/ui/pages/my_profile_page.dart';
import 'package:care_app/ui/pages/password_reset_page.dart';
import 'package:care_app/ui/pages/vehicle_page.dart';
import 'package:flutter/material.dart';


class Router {

  static const String initialRoute = 'loginPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<Scaffold>(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('Ruta / ${settings.name}'),
              ),
            ));
      case LoginPage.ID:
        return MaterialPageRoute<LoginPage>(builder: (_) => LoginPage());
      case AddUserPage.ID:
        return MaterialPageRoute<AddUserPage>(builder: (_) => AddUserPage());
      case PasswordResetPage.ID:
        return MaterialPageRoute<PasswordResetPage>(builder: (_) => PasswordResetPage());
      case VehiclePage.ID:
        return MaterialPageRoute<VehiclePage>(builder: (_) => VehiclePage());
      case MyProfilePage.ID:
        final User user = settings.arguments;
        return MaterialPageRoute<MyProfilePage>(builder: (_) => MyProfilePage(user));
      case FilterPage.ID:
        return MaterialPageRoute<FilterPage>(builder: (_) => FilterPage());
      case AddVehiclePage.ID:
        final User user = settings.arguments;
        return MaterialPageRoute<AddVehiclePage>(builder: (_) => AddVehiclePage(user));
      default:
        return MaterialPageRoute<Scaffold>(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}

/*Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    LoginPage.ID: (BuildContext context) => LoginPage(),

    *//*'AddUserPage': (BuildContext context) => const AddUserPage(),
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
    '/addTripPage' : (BuildContext context ) => AddTripPage(),*//*
  };
}*/

//Map<String, WidgetBuilder> getRoutes() {
//  return <String, WidgetBuilder>{
//    //'/loginPage': (BuildContext context) => LoginPage(),
//    '/addUserPage': (BuildContext context) => const AddUserPage(),
//    '/resetPasswordPage': (BuildContext context) => PasswordResetPage(),
//    '/myProfilePage': (BuildContext context) => MyProfilePage(),
//    '/vehiclePage': (BuildContext context) =>  VehiclePage(),
//    '/addVehiclePage': (BuildContext context) => const AddVehiclePage(),
//    '/filterPage': (BuildContext context) => const FilterPage(),
//    '/brakePage': (BuildContext context) => const BrakesPage(),
//    '/lightPage': (BuildContext context) => LigthsPage(),
//    '/transitTaxPage': (BuildContext context) => TransitTaxesPage(),
//    '/kmPage': (BuildContext context) => KmsPage(),
//    '/gasolinePage': (BuildContext context) => GasolinePage(),
//    '/addFilterPage': (BuildContext context) => const AddFilterPage(),
//    '/gasolinerasPage' : (BuildContext context ) => GasolinaPage(),
//    '/localesPage'               : (BuildContext context ) => const LocalesPage(),
//    '/localDetailPage'           : (BuildContext context ) => LocalDetailPage(),
//    '/tripPage' : (BuildContext context ) => TripPage(),
//    '/addTripPage' : (BuildContext context ) => AddTripPage(),
//  };
//}
