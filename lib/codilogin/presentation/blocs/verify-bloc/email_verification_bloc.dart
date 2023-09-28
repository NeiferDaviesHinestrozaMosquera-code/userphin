import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'email_verification_event.dart';
part 'email_verification_state.dart';


class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  EmailVerificationBloc() : super(EmailUnverifiedState()) {
    on<StartEmailVerificationEvent>((event, emit) async {
      await checkEmailVerified();
      if (isEmailVerified) {
        emit(EmailVerifiedState());
      } else {
        emit(EmailVerifyingState());
        await sendVerificationEmail();
        if (!isEmailVerified) {
          timer = Timer.periodic(
            const Duration(seconds: 3),
            (_) => add(CheckEmailVerifiedEvent()),
          );
        }
      }
    });
    on<ResendEmailVerificationEvent>((event, emit) async {
      await checkEmailVerified();
      if (!isEmailVerified) {
        emit(EmailVerifyingState());
        await sendVerificationEmail();
        if (!isEmailVerified) {
          timer = Timer.periodic(
            const Duration(seconds: 0),
            (_) => add(CheckEmailVerifiedEvent()),
          );
        }
      }
    });
    on<CheckEmailVerifiedEvent>((event, emit) async {
      await checkEmailVerified();
      if (isEmailVerified) {
        timer?.cancel();
        emit(EmailVerifiedState());
      } else {
        emit(EmailVerifiedErrorState('Error: El correo no está verificado.'));
      }
    });
  }
  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
        canResendEmail = false;
        await Future.delayed(const Duration(seconds: 5));
        canResendEmail = true;
      }
    } catch (e) {
      emit(EmailVerifiedErrorState(
          'Error: No se pudo enviar el correo de verificación.'));
    }
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
