import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:userphin/chatgpt/screens/login.dart';
import 'package:userphin/googlelogin.dart/login/login_bloc.dart';
import 'package:userphin/googlelogin.dart/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final registerBloc = BlocProvider.of<RegisterBloc>(context);
  //final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: BlocProvider(
        create: (context) => RegisterBloc(),
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterInitial) {
              return _buildRegisterForm();
            } else if (state is RegisterLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is RegisterSuccess) {
              return Center(child: Text('Registration successful'));
            } else if (state is RegisterFailure) {
              return Center(child: Text('Registration failed'));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<RegisterBloc>(context).add(
                  RegisterButtonPressed(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
              }
            },
            child: Text('Register'),
          ),
           ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("lOGIN"))
        ],
      ),
    );
  }
}