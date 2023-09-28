// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:userphin/codilogin/data/repository.dart';
// import 'package:userphin/codilogin/presentation/register-bloc/register_bloc.dart';
// import 'package:userphin/codilogin/presentation/widgets/widgets.dart';
// import 'package:userphin/codilogin/utils/const.dart';

// class RegisterScreen extends StatelessWidget {
//   final RegisterBloc registerBloc;
//   RegisterScreen(this.registerBloc, {super.key});
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _usernameController = TextEditingController();
//   bool _passwordControllerVisible = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: BlocListener<RegisterBloc, RegisterState>(
//       listener: (context, state) {
//         if (state is RegisterLoading) {
//           showDownloading();
//         } else if (state is RegisterFailure) {
//           getAnimatedSnackbarError(state.error, context);
//         }
//       },
//       child: BlocConsumer<RegisterBloc, RegisterState>(
//         builder: (context, state) {
//           if (state is RegisterLoading) {
//             return showDownloading();
//           } else if (state is RegisterFailure) {
//             return Center(child: Text(state.error));
//           } else {
//             return Center(
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     UserNameFormField(_usernameController),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     EmailFormField(_emailController),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     PasswordFormField(_passwordController),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       child: const Text('Register'),
//                       onPressed: () {
//                         try {
//                           registerBloc.add(
//                             RegisterEvent(
//                               _usernameController.text,
//                               _emailController.text,
//                               _passwordController.text,
//                             ),
//                           );
//                         } catch (e) {
//                           if (e is SignUpWithEmailAndPasswordFailure) {
//                             getAnimatedSnackbarError(
//                               e.message,
//                               context,
//                             );
//                             print(e.message);
//                           } else {
//                             print('An unknown exception occurred: $e');
//                           }
//                         }
//                       },
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/login');
//                         },
//                         child: const Text("Login"))
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//         listener: (context, state) {
//           if (state is RegisterLoggedIn) {
//             Navigator.pushNamed(context, '/login');
//             showDialog(
//               context: context,
//               builder: (context) => const AlertDialog(
//                 content: Text("Buen trabajo"),
//               ),
//             );
//           }
//         },
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userphin/codilogin/data/repository.dart';
import 'package:userphin/codilogin/presentation/blocs/register-bloc/register_bloc.dart';
import 'package:userphin/codilogin/presentation/widgets/widgets.dart';
import 'package:userphin/codilogin/utils/const.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterBloc registerBloc;

  RegisterScreen(this.registerBloc, {Key? key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _passwordControllerVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            showDownloading();
          } else if (state is RegisterFailure) {
            getAnimatedSnackbarError(state.error, context);
          }
        },
        child: BlocConsumer<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Cargando...."),
                  ],
                ),
              );
            }
            return Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserNameFormField(_usernameController),
                    const SizedBox(
                      height: 10,
                    ),
                    EmailFormField(_emailController),
                    const SizedBox(
                      height: 10,
                    ),
                    PasswordFormField(_passwordController),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      child: const Text('Register'),
                      onPressed: () {
                        try {
                          registerBloc.add(
                            RegisterEvent(
                              _usernameController.text,
                              _emailController.text,
                              _passwordController.text,
                            ),
                          );
                        } catch (e) {
                          if (e is SignUpWithEmailAndPasswordFailure) {
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
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text("Login"),
                    )
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is RegisterLoggedIn) {
              Navigator.pushNamed(context, '/login');
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  content: Text("Buen trabajo"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
