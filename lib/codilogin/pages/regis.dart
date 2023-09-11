import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userphin/codilogin/bloc/auth_bloc.dart';
import 'package:userphin/codilogin/pages/login.dart';

class RegisterScreen extends StatelessWidget {
  final AuthBloc authBloc;

  RegisterScreen(this.authBloc);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AuthFailure) {
            return Center(child: Text(state.error));
          } else {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    child: Text('Register'),
                    onPressed: () {
                      authBloc.add(RegisterEvent(
                        _emailController.text,
                        _passwordController.text,
                      ));
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen(authBloc)),
                        );
                      },
                      child: Text("Login"))
                ],
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is AuthLoggedIn) {
            // Navegar a la pantalla principal después de registrarse con éxito
            Dialog(
              child: Text("Buen trabajo"),
            );
          }
        },
      ),
    );
  }
}
