part of 'login_bloc.dart';
abstract class LoginState {}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginLoggedIn extends LoginState {} // Changed from LoginSuccess to LoginLoggedIn
class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}