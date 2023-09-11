import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userphin/pandalogin/presentation/bloc/auth_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:userphin/pandalogin/presentation/screens/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
    return Scaffold(
      appBar: AppBar(title: Text("Text"),),
      body: BlocBuilder<AuthBloc,AuthState>(
        builder: (context , state) {
          if ( state is Loading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          }
          if ( state is UnAuthenticated) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: SingleChildScrollView(
                  reverse: true, //revisar
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WELCOME BACK , SIGN IN"),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                   keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: "Email",
                                    border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value != null &&
                                            !EmailValidator.validate(value)
                                        ? 'Enter a valid email'
                                        : null;
                                  },
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _passwordController,
                                  decoration: const InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value != null && value.length < 6
                                        ? "Enter min. 6 characters"
                                        : null;
                                  },
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                TextButton.icon(onPressed: (){
                                  _authenticateWithEmailAndPassword(context);
                                }, icon: Icon(Icons.email), label: Text("Sign In"),)
                                //  SignInButtonBuilder(
                                //   text: 'Sign in',
                                //   icon: Icons.email,
                                //   onPressed: () {
                                //     _authenticateWithEmailAndPassword(context);
                                //   },
                                //   backgroundColor: Colors.green,
                                //   width: 120,
                                // )
                            ],
                          )
                        ),
                      ),
                       const SizedBox(
                          height: 20,
                        ),
                        const Text("or", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton.icon(onPressed: () {
                          _authenticateWithGoogle(context);
                        }, icon: Icon(Icons.abc),label: Text("Sign in With Google")),
                        // SignInButton(
                        //   Buttons.Google,
                        //   text: "Sign in with Google",
                        //   onPressed: () {
                        //     _authenticateWithGoogle(context);
                        //   },
                        // ),
                        TextButton(onPressed: () {
                           Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()),
                            );
                        }, child: Text("Dont have an account?"))
                        // SignInButtonBuilder(
                        //   text: "Don't have an account?",
                        //   onPressed: () {
                        //     Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => const SignUp()),
                        //     );
                        //   },
                        //   backgroundColor: Colors.blueGrey[700]!,
                        // ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container(child: Text("Fallas tecnicas"),);
        }
      ),
    );
  }

  
  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}