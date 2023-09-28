part of 'recovery_bloc.dart';

abstract class RecoveryState  {

}

class RecoveryInitial extends RecoveryState {}

class RecoveryLoading extends RecoveryState {}

class RecoveryLSuccessful extends RecoveryState {}

class RecoveryFailure extends RecoveryState {
  final String errorMessage;

  RecoveryFailure(this.errorMessage);

  List<Object?> get props => [errorMessage];
}