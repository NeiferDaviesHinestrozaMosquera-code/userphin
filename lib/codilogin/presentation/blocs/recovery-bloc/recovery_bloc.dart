import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'recovery_event.dart';
part 'recovery_state.dart';

class RecoveryBloc extends Bloc<RecoveryEvent, RecoveryState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RecoveryBloc() : super(RecoveryInitial()) {
    on<RecoveryEmail>((event, emit) async {
      emit(RecoveryLoading());
      try {
        await _auth.sendPasswordResetEmail(email: event.email);
        emit(RecoveryLSuccessful());
      } catch (e) {
        emit(RecoveryFailure(e.toString()));
      }
    });
  }
}