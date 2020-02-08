import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/enums/auth_state_enum.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/pages/login_page.dart';
import 'package:care_app/ui/pages/splash_page.dart';
import 'package:care_app/ui/pages/vehicle_page.dart';
import 'package:care_app/ui/routes/routes.dart';

import 'core/services/firebase/firebase_notifications.dart';


void main() {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseNotifications().setUpFirebase();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('es'), // English
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
      home: ChangeNotifierProvider<LoginProvider>(
        create: (_) => locator<LoginProvider>(),
        child: Consumer<LoginProvider>(
          builder: (BuildContext context, LoginProvider login, _) {
            switch (login.authStatus) {
              case AuthStatus.Uninitialized:
                return SplashPage();
              case AuthStatus.Unauthenticated:
              case AuthStatus.Authenticating:
              return LoginPage();
              case AuthStatus.Authenticated:
                return VehiclePage();
              default:
                return const Scaffold(
                  body: Center(
                    child: Text('SURGIO UN PROBLEMA'),
                  ),
                );
            }
          },
        ),
      ),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(32, 32, 32, 1),
      ),
    );
  }
}
