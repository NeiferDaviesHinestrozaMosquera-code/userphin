part of 'login_bloc.dart';

abstract class LoginAuthEvent {}

class LoginEvent extends LoginAuthEvent {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}
