part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationState {
  final AuthenticationStatus status;
  final User? user;

  const AuthenticationState({this.status = AuthenticationStatus.unknown, this.user});
}