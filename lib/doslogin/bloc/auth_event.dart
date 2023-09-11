part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final User user;

  LoggedIn(this.user);
}

class LoggedOut extends AuthEvent {}

class RegisterSubmitted extends AuthEvent {
  final String email;
  final String password;

  RegisterSubmitted(this.email, this.password); 
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  LoginSubmitted(this.email, this.password);
}