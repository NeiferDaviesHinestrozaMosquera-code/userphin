// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:userphin/doslogin/bloc/auth_bloc.dart';


// class LoginScreen extends StatelessWidget {

//   final AuthBloc authBloc;

//   LoginScreen({required this.authBloc});

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
//               onChanged: (email) => emailuser = email,
//             ),
//             TextField(
//               obscureText: true,
//               onChanged: (password) => passworduser = password,
//             ),
//             TextButton(
//               onPressed: () {
//                 authBloc.add(LoginSubmitted(emailuser , password));  
//               },
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );

//   }

// }