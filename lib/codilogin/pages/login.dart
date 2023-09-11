import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userphin/codilogin/bloc/auth_bloc.dart';
import 'package:userphin/codilogin/pages/home.dart';

class LoginScreen extends StatelessWidget {
  final AuthBloc authBloc;

  LoginScreen(this.authBloc);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
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
                    child: Text('Login'),
                    onPressed: () {
                      authBloc.add(LoginEvent(
                        _emailController.text,
                        _passwordController.text,
                      ));
                    },
                  ),
                ],
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is AuthLoggedIn) {
            // Navegar a la pantalla principal después de iniciar sesión con éxito
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
      ),
    );
  }
}
