part of 'email_verification_bloc.dart';

// abstract class EmailVerificationState {}

abstract class EmailVerificationState {

}
class EmailUnverifiedState extends EmailVerificationState {
}

class EmailVerifyingState extends EmailVerificationState {
}

class EmailVerifiedState extends EmailVerificationState {
}

class EmailVerifiedErrorState extends EmailVerificationState {
  final String error;

  EmailVerifiedErrorState( this.error);
}
