import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:care_app/repository/user_repository.dart';

import 'package:care_app/auth/auth.dart';
import 'package:care_app/src/pages/spash_screen.dart';
import 'package:care_app/login/login.dart';
import 'package:care_app/src/pages/vehicle_page.dart';
import 'package:care_app/extras/circular_loader.dart';


class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc<dynamic, dynamic> bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (BuildContext context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {

  App({Key key, @required this.userRepository}) : super(key: key);

  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          else if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository);
          }
          else if (state is AuthenticationAuthenticated) {
            return VehiclePage();
          }
          else {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:care_app/src/routes/routes.dart';
import 'package:care_app/src/pages/vehicle_page.dart';
import 'package:care_app/src/pages/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


Future<void> main() async {

  const FlutterSecureStorage storage = FlutterSecureStorage();
  final String _token = await storage.read(key: 'token');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getRoutes(),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(32, 32, 32, 1),
      ),
      home: _token == null ? LoginPage() : const VehiclePage(),
    )
    
  
  );
}
*/
