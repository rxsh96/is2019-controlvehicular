import 'package:flutter/material.dart';

import 'package:care_app/core/src/models/user_model.dart';
import 'package:care_app/core/src/repository/user_repository.dart';

import 'package:care_app/ui/pages/pages_files.dart';

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
      case ExpensesPage.ID:
        return MaterialPageRoute<ExpensesPage>(builder: (_) => ExpensesPage());
      case TripPage.ID:
        return MaterialPageRoute<TripPage>(builder: (_) => TripPage());
      case GasolinePage.ID:
        return MaterialPageRoute<GasolinePage>(builder: (_) => const GasolinePage());
<<<<<<< HEAD
      case GasolinePage.ID:
        return MaterialPageRoute<GasolinePage>(builder: (_) => GasolinePage());
=======
      case GasolineMapPage.ID:
        return MaterialPageRoute<GasolineMapPage>(builder: (_) => const GasolineMapPage());
>>>>>>> 39f0560cedf0119c4806b4fef27b00aff8b39efe
      case AddTripPage.ID:
        return MaterialPageRoute<AddTripPage>(builder: (_) => AddTripPage());
      case LocalsPage.ID:
        return MaterialPageRoute<LocalsPage>(builder: (_) => const LocalsPage());
      case LocalDetailPage.ID:
        return MaterialPageRoute<LocalDetailPage>(builder: (_) => LocalDetailPage());
      case MyProfilePage.ID:
        final UserRepository userRepo = settings.arguments;
        return MaterialPageRoute<MyProfilePage>(builder: (_) => MyProfilePage(userRepo));
      case FilterPage.ID:
        return MaterialPageRoute<FilterPage>(builder: (_) => const FilterPage());
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
