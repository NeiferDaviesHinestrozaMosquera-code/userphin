import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = _auth.currentUser;
      if (user != null) {
        emit(AuthAuthenticated(user));  
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (_) {
      emit(AuthUnauthenticated());
    }
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) {
    emit(AuthAuthenticated(event.user));
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) {    
    emit(AuthUnauthenticated());
  }

  void _onRegisterSubmitted(RegisterSubmitted event, Emitter<AuthState> emit) async {
    try {
      final userCreds = await _auth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(AuthLoading());
      final user = userCreds.user;
      emit(AuthAuthenticated(user!));
    } catch (e) {
      emit(AuthError(e.toString())); 
    }
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<AuthState> emit) async {
    try {
      final userCreds = await _auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(AuthLoading());
      final user = userCreds.user;
      emit(AuthAuthenticated(user!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

}