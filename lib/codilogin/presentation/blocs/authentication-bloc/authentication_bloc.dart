import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc() : super(AuthenticationState()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  void _onAppStarted(AppStarted event, Emitter<AuthenticationState> emit) {
    // Lógica para comprobar si el usuario está autenticado o no
    // Utiliza _auth.currentUser para obtener el usuario actualmente autenticado
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthenticationState> emit) {
    // Lógica para manejar el inicio de sesión exitoso
    // Utiliza _auth.signInWithCredential para autenticar al usuario con las credenciales de Google
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    void signInWithGoogle(BuildContext context) async {
      BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
      try {
        final GoogleSignInAccount? googleSignInAccount =
            await _googleSignIn.signIn();
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        final User? user = userCredential.user;

        // Aquí puedes guardar los datos del usuario en tu Bloc o realizar otras acciones necesarias
      } catch (e) {
        print(e.toString());
      }
    }
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) {
    // Lógica para manejar el cierre de sesión exitoso
    // Utiliza _auth.signOut para cerrar la sesión del usuario actual
  }
}
