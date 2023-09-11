part of 'register_bloc.dart';

abstract class RegisterState  {
 
}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterLoggedIn extends RegisterState {} // Changed from RegisterSuccess to RegisterLoggedIn
class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure(this.error);
}