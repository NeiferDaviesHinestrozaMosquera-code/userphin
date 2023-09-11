// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:userphin/claudelogin/bloc/auth_claude_bloc.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {

//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<AuthClaudeBloc, AuthClaudeState>(
//         listener: (context, state) {
//           // redirigir si está autenticado
//         }, 
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [

//               // Email 
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),

//               // Password 
//               TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,    
//               ),
  
//               SizedBox(height: 20),
  
//               // Botón login
//               ElevatedButton(
//                 onPressed: () {
//                   context.bloc<AuthClaudeBloc>().add(LoginClaudeEvent(
//                     email: emailController.text, 
//                     password: passwordController.text
//                   ));
//                 }, 
//                 child: Text('Login')  
//               ),

//             ],
//           ),
//         ),  
//       ),
//     );
//   }
// }