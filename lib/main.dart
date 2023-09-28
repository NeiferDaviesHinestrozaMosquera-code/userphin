import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:userphin/codilogin/presentation/blocs/login-bloc/login_bloc.dart';
import 'package:userphin/codilogin/presentation/blocs/recovery-bloc/recovery_bloc.dart';
import 'package:userphin/codilogin/presentation/blocs/register-bloc/register_bloc.dart';
import 'package:userphin/codilogin/presentation/blocs/verify-bloc/email_verification_bloc.dart';
import 'package:userphin/codilogin/presentation/pages/pages.dart';
import 'package:userphin/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  runApp(MyApp(
    loginBloc: LoginBloc(_firebaseAuth,_googleSignIn),
    registerBloc: RegisterBloc(_firebaseAuth),
    emailVerificationBloc: EmailVerificationBloc(),
    recoveryBloc: RecoveryBloc(),
    //uthenticationBloc: AuthenticationBloc(),
  ));
}

class MyApp extends StatelessWidget {
  final LoginBloc loginBloc;
  final RegisterBloc registerBloc;
  final EmailVerificationBloc emailVerificationBloc;
  final RecoveryBloc recoveryBloc;
  //inal AuthenticationBloc authenticationBloc;

  MyApp({
    required this.loginBloc,
    required this.registerBloc,
    required this.emailVerificationBloc,
    required this.recoveryBloc,
    //required this.authenticationBloc,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super D',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: loginBloc),
          BlocProvider.value(value: registerBloc),
          BlocProvider.value(value: emailVerificationBloc),
          BlocProvider.value(value: recoveryBloc),
          //BlocProvider.value(value: authenticationBloc),
        ],
        child: LoginScreen(loginBloc),
      ),
      routes: {
        '/login': (context) => BlocProvider.value(
              value: loginBloc,
              child: LoginScreen(loginBloc),
            ),
        '/register': (context) => BlocProvider.value(
              value: registerBloc,
              child: RegisterScreen(registerBloc),
            ),
        '/verify': (context) => BlocProvider.value(
              value: emailVerificationBloc,
              child: VerifyEmailScreen(),
            ),
        '/recovery': (context) => BlocProvider.value(
              value: recoveryBloc,
              child: RecoveryScreen(recoveryBloc),
            ),
      },
    );
  }
}