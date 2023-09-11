// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:userphin/doslogin/bloc/auth_bloc.dart';

// class RegisterScreen extends StatelessWidget {

//   final AuthBloc authBloc;

//   RegisterScreen({required this.authBloc});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         if (state is AuthAuthenticated) {
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => HomeScreen())
//           );    
//         }
//       },
//       child: Scaffold(
//         body: Column(
//           children: [
//             TextField(
//               onChanged: (email) => _email = email,
//             ),
//             TextField(
//               obscureText: true,
//               onChanged: (password) => _password = password,
//             ),
//             TextButton(
//               onPressed: () {
//                 authBloc.add(RegisterSubmitted(_email, _password));
//               },
//               child: Text('Register'), 
//             ),
//           ],
//         ),
//       ),
//     );

//   }

// }