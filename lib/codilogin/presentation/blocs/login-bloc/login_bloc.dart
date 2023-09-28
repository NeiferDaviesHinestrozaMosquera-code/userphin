import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:userphin/codilogin/data/repository.dart';
// import 'package:userphin/codilogin/presentation/login-bloc/login_event.dart';
// import 'package:userphin/codilogin/presentation/login-bloc/login_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  UserCredential? singIn;

  LoginBloc(this._firebaseAuth, this._googleSignIn) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        if (event is LoginWithGoogle) {
          final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
          final GoogleSignInAuthentication googleAuth =
              await googleUser!.authentication;
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          singIn = await _firebaseAuth.signInWithCredential(credential);
        } else {
          singIn = await _firebaseAuth
              .signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          )
              .onError((error, stackTrace) {
            emit(LoginFailure(error.toString()));
            return Future.value(null);
          });
        }
        if (singIn != null) {
          emit(LoginLoggedIn());
        }
      } catch (e) {
        emit(LoginFailure('An error occurred. Please try again later.'));
      }
    });
  }
}