import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:care_app/auth/auth.dart';
import 'package:care_app/login/login.dart';
import 'package:care_app/repository/user_repository.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;


  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final String token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        if(token != null && token != 'Unable to authenticate with provided credentials'){
          authenticationBloc.add(LoggedIn(token: token));
          yield LoginInitial();
        }
        else{
          yield const LoginFailure(error: 'Credenciales Incorrectas');
        }
//        authenticationBloc.add(LoggedIn(token: token));
//        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
