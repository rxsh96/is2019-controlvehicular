import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => <dynamic>[];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  const LoginFailure({@required this.error});

  final String error;

  @override
  List<Object> get props => <dynamic>[error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
