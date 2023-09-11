import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userphin/codilogin/login-bloc/login_bloc.dart';
import 'package:userphin/codilogin/pages/home.dart';

class LoginScreen extends StatelessWidget {
  final LoginBloc loginBloc;
  LoginScreen(this.loginBloc);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),  automaticallyImplyLeading: false,
),
      body: BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoginFailure) {
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
                      loginBloc.add( // Changed from authBloc to loginBloc
                        LoginEvent(
                          _emailController.text,
                          _passwordController.text,
                        ),
                      );
                    },
                  ),
                   ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: () {
                     Navigator.pushNamed(context, '/register');
                    },
                    child: Text("Register")
                  )
                ],
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is LoginLoggedIn) {
            // Navigate to the main screen after successfully logging in
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