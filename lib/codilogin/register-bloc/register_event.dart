part of 'register_bloc.dart';

abstract class RegisterAuthEvent {}

class RegisterEvent extends RegisterAuthEvent {
  final String email;
  final String password;
  RegisterEvent(this.email, this.password);
}
