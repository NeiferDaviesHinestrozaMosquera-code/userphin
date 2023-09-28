import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userphin/codilogin/presentation/blocs/verify-bloc/email_verification_bloc.dart';
import 'package:userphin/codilogin/presentation/pages/pages.dart';


  class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Llegamos");
    return BlocProvider(
      
      create: (context) => EmailVerificationBloc(),
      child: BlocBuilder<EmailVerificationBloc, EmailVerificationState>(
      
        builder: (context, state) {
          if (state is EmailVerifiedState) {
            return HomeScreen();
          } else {
            return Scaffold(
              appBar: AppBar(title: Text("Verify Email"),automaticallyImplyLeading: false,),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Se ha enviado un mensaje de verificación a su correo electrónico.',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      icon: const Icon(Icons.email, size: 32),
                      label: const Text(
                        'Reenviar correo electrónico',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: () => BlocProvider.of<EmailVerificationBloc>(context).add(ResendEmailVerificationEvent()),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(context,'/login');
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
