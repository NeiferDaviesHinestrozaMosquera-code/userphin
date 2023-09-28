part of 'recovery_bloc.dart';

abstract class RecoveryEvent {}

class RecoveryEmail extends RecoveryEvent {
  final String email;

  RecoveryEmail(this.email);
}

// class FirebaseExceptionEvent extends RecoveryEvent {
//   final FirebaseException exception;
//   FirebaseExceptionEvent(this.exception);

//   List<Object?> get props => [exception];
// }