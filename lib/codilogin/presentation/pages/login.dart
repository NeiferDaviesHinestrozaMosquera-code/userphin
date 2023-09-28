import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:userphin/codilogin/data/repository.dart';
import 'package:userphin/codilogin/presentation/blocs/login-bloc/login_bloc.dart';
import 'package:userphin/codilogin/presentation/pages/pages.dart';
import 'package:userphin/codilogin/presentation/widgets/widgets.dart';
import 'package:userphin/codilogin/utils/const.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatelessWidget {
  final LoginBloc loginBloc;

  LoginScreen(this.loginBloc) : super();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
// corregir
 final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      // Aquí puedes autenticar al usuario con las credenciales de Google
    } catch (e) {
      print(e.toString());
    }
  }
//

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              showDownloading();
            } else if (state is LoginFailure) {
              getAnimatedSnackbarError(state.error, context);
            }
          },
          child: BlocConsumer<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoggedIn) {
                return Container(
                  child: Text("ERROR PERRAS"),
                );
              }
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text(
                          'Bienvenido a Super D',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      EmailFormField(_emailController),
                      const SizedBox(height: 20),
                      PasswordFormField(_passwordController),
                      const SizedBox(height: 5),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/recovery');
                          },
                          child: Text("¿Olvidaste tu contraseña?"),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          try {
                            String email = _emailController.text.trim();
                            String password = _passwordController.text.trim();

                            if (email.isEmpty || password.isEmpty) {
                              getAnimatedSnackbarError(
                                  "El correo electrónico y la contraseña no pueden estar vacíos",
                                  context);
                            } else {
                              loginBloc.add(
                                LoginEvent(email, password),
                              );
                            }
                          } catch (e) {
                            if (e is LogInWithEmailAndPasswordFailure) {
                              getAnimatedSnackbarError(
                                e.message,
                                context,
                              );
                              print(e.message);
                            } else {
                              print('An unknown exception occurred: $e');
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text("Registro"),
                      ),
                      const Divider(
                        color: Colors.transparent,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconButtonSocial(
                              IonIcons.logo_google, 
                                 () =>_signInWithGoogle(context),
                               Colors.greenAccent),
                          iconButtonSocial(IonIcons.logo_facebook, () {
                            getAnimatedSnackbarInfo(
                                "Estamos trabajando para iniciar sesion con facebook",
                                context);
                       
                           
                          }, Colors.blue),
                          iconButtonSocial(IonIcons.phone_portrait, () {
                            getAnimatedSnackbarInfo(
                                "Estamos trabajando para iniciar sesion con tu celular",
                                context);
                          }, Colors.redAccent),
                          iconButtonSocial(IonIcons.logo_twitter, () {
                            getAnimatedSnackbarInfo(
                                "Estamos trabajando para iniciar sesion con x",
                                context);
                          }, Colors.black),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Center(
                          child: Text(
                        "Nirobi.dev",
                        style: TextStyle(color: Colors.black12),
                      ))
                    ],
                  ),
                ),
              );
            },
            listener: (context, state) {
              if (state is LoginLoggedIn) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerifyEmailScreen(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
