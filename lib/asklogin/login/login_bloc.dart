import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _firebaseAuth;

  LoginBloc({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth,
        super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      if (event is LoginButtonPressed) {
        emit(LoginLoading());

        _firebaseAuth
            .signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        )
            .then((_) {
          emit(LoginSuccess());
        }).catchError((error) {
          emit(LoginFailure(error: error.toString()));
        });
      }

      if (event is RegisterButtonPressed) {
        emit(LoginLoading());

        _firebaseAuth
            .createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        )
            .then((_) {
          emit(LoginSuccess());
        }).catchError((error) {
          emit(LoginFailure(error: error.toString()));
        });
      }
    });
  }
  
  // ... rest of the code
}
