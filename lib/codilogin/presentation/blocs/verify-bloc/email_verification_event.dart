part of 'email_verification_bloc.dart';

// email_verification_event.dart
abstract class EmailVerificationEvent {}

class StartEmailVerificationEvent extends EmailVerificationEvent {}

class ResendEmailVerificationEvent extends EmailVerificationEvent {}

class CheckEmailVerifiedEvent extends EmailVerificationEvent {}
