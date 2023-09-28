/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userphin/codilogin/presentation/pages/pages.dart';
import 'package:go_router/go_router.dart';
import 'package:userphin/codilogin/presentation/login-bloc/login_bloc.dart';
import 'package:userphin/codilogin/presentation/pages/recovery.dart';
import 'package:userphin/codilogin/presentation/recovery-bloc/recovery_bloc.dart';
import 'package:userphin/codilogin/presentation/register-bloc/register_bloc.dart';
import 'package:userphin/codilogin/presentation/verify-bloc/email_verification_bloc.dart';

class AppRoutes {
  final LoginBloc loginBloc;
  final RegisterBloc registerBloc;
  final EmailVerificationBloc emailVerificationBloc;
  final RecoveryBloc recoveryBloc;

  AppRoutes({
    required this.loginBloc,
    required this.registerBloc,
    required this.emailVerificationBloc,
    required this.recoveryBloc,
  });

  List<GoRoute> get routes => [
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) => MaterialPage(
            key: state.key, // Add this line
            child: BlocProvider.value(
              value: loginBloc,
              child: LoginScreen(loginBloc),
            ),
          ),
        ),
        GoRoute(
          path: '/register',
          pageBuilder: (context, state) => MaterialPage(
            key: state.key, // Add this line
            child: BlocProvider.value(
              value: registerBloc,
              child: RegisterScreen(registerBloc),
            ),
          ),
        ),
        GoRoute(
          path: '/verify',
          pageBuilder: (context, state) => MaterialPage(
            key: state.key, // Add this line
            child: BlocProvider.value(
              value: emailVerificationBloc,
              child: VerifyEmailScreen(),
            ),
          ),
        ),
        GoRoute(
          path: '/recovery',
          pageBuilder: (context, state) => MaterialPage(
            key: state.key, // Add this line
            child: BlocProvider.value(
              value: recoveryBloc,
              child: RecoveryScreen(recoveryBloc),
            ),
          ),
        ),
      ];
}*/
