import 'package:flutter/material.dart';
import 'package:userphin/codilogin/utils/const.dart';

class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code , BuildContext context) {
    switch (code) {
      case 'invalid-email':
        return  getAnimatedSnackbarError(
          'Email is not valid or badly formatted.',context
        );
      case 'user-disabled':
        return  getAnimatedSnackbarError(
          'This user has been disabled. Please contact support for help.',context
        );
      case 'email-already-in-use':
        return  getAnimatedSnackbarError(
          'An account already exists for that email.',context
        );
      case 'operation-not-allowed':
        return  getAnimatedSnackbarError(
          'Operation is not allowed.  Please contact support.',context
        );
      case 'weak-password':
        return  getAnimatedSnackbarError(
          'Please enter a stronger password.',context
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code ,BuildContext context ) {
    switch (code) {
      case 'invalid-email':
      
        return  getAnimatedSnackbarError('Email is not valid or badly formatted.', context);

      case 'user-disabled':
        return  getAnimatedSnackbarError(
          'This user has been disabled. Please contact support for help.', context
        );
      case 'user-not-found':
        return  getAnimatedSnackbarError(
          'Email is not found, please create an account.', context
        );
      case 'ERROR_WRONG_PASSWORD':
        return 
          getAnimatedSnackbarError('Incorrect password, please try again.', context);
       
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  
  }

  /// The associated error message.
  final String message;
}

