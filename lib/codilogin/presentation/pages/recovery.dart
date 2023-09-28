import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userphin/codilogin/presentation/blocs/recovery-bloc/recovery_bloc.dart';
import 'package:userphin/codilogin/presentation/pages/pages.dart';
import 'package:userphin/codilogin/presentation/widgets/widgets.dart';
import 'package:userphin/codilogin/utils/const.dart';

class RecoveryScreen extends StatelessWidget {
  final RecoveryBloc recoveryBloc;

  RecoveryScreen(this.recoveryBloc) : super();

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<RecoveryBloc, RecoveryState>(
          builder: (context, state) {
            if (state is RecoveryLoading) {
              return showDownloading();
            } else if (state is RecoveryFailure) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Center(
                            child: Column(
                              children: [
                                Text(
                                  'Bienvenido a Super D',
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Recupera tu contraseña",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          EmailFormField(_emailController),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            child: const Text('Recovery'),
                            onPressed: () {
                              recoveryBloc
                                  .add(RecoveryEmail(_emailController.text));
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text("Regresar al Login"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/doc4.png',
                      alignment: Alignment.centerRight,
                      fit: BoxFit.cover,
                      
                    ),
                  ),
                ],
              );
            }
          },
          listener: (context, state) {
            if (state is RecoveryLSuccessful) {
              Navigator.pushNamed(context, '/login');
            }
            getAnimatedSnackbarSuccess(
                "Contraseña recupera con exito", context);
          },
        ),
      ),
    );
  }
}
