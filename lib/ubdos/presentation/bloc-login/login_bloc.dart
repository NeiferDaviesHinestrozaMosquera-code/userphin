import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:userphin/pandalogin/data/repository/auth_respository.dart';

part 'login_event.dart';
part 'login_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc({required AuthRepository authRepository}) : super(AuthInitialState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is RegisterEvent) {
      yield AuthLoadingState();
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        yield AuthAuthenticatedState(userCredential.user!);
      } on FirebaseAuthException catch (e) {
        yield AuthUnauthenticatedState();
      }
    } else if (event is LoginEvent) {
      yield AuthLoadingState();
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        yield AuthAuthenticatedState(userCredential.user!);
      } on FirebaseAuthException catch (e) {
        yield AuthUnauthenticatedState();
      }
    } else if (event is LogoutEvent) {
      await _auth.signOut();
      yield AuthUnauthenticatedState();
    }
  }
}

