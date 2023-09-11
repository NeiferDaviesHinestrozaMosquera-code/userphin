import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userphin/codilogin/login-bloc/login_bloc.dart';
import 'package:userphin/codilogin/pages/login.dart';
import 'package:userphin/codilogin/register-bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterBloc registerBloc;
  RegisterScreen(this.registerBloc);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register'),  automaticallyImplyLeading: false,
),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RegisterFailure) {
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
                      registerBloc.add(
                        RegisterEvent(
                          _emailController.text,
                          _passwordController.text,
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                     Navigator.pushNamed(context, '/login');
                    },
                    child: Text("Login")
                  )
                ],
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is RegisterLoggedIn) {
            // Show a dialog after successfully registering
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text("Buen trabajo"),
              ),
            );
          }
        },
      ),
    );
  }
}