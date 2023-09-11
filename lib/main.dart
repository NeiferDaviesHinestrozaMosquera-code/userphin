// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:userphin/firebase_options.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:userphin/pandalogin/data/repository/auth_respository.dart';
// import 'package:userphin/pandalogin/presentation/screens/signin.dart';
// import 'package:userphin/ubdos/presentation/bloc-login/login_bloc.dart';
// import 'package:userphin/ubdos/presentation/screens/login.dart';
// import 'package:userphin/ubdos/presentation/widgets/form_widget.dart';
// import 'package:userphin/ubdos/presentation/widgets/login_widget.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(
//     RepositoryProvider(
//       create: (context) => AuthRepository(),
//       child: BlocProvider(
//         create: (context) => AuthBloc(
//           authRepository: RepositoryProvider.of<AuthRepository>(context),
//         ),
//         child: MyApp(),
//       ),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: SignIn(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:userphin/claudelogin/bloc/auth_claude_bloc.dart';
// import 'package:userphin/poelogin/bloc/auth_bloc.dart';
// import 'package:userphin/poelogin/screens/login.dart';
// import 'package:userphin/firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// }

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocProvider(
//         create: (context) => AuthClaudeBloc(),
//         child: LoginPage(),
//       ),
//     );
//   }
// }



// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:userphin/firebase_options.dart';
// import 'package:userphin/googlelogin.dart/login/login_bloc.dart';
// import 'package:userphin/googlelogin.dart/pages/loginpage.dart';
// import 'package:userphin/googlelogin.dart/register/register_bloc.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MultiBlocProvider(
//         providers: [
//           BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
//           BlocProvider<LoginBloc>(create: (context) => LoginBloc(),)
//         ],
//         child: LoginPage(),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userphin/codilogin/bloc/auth_bloc.dart';
import 'package:userphin/codilogin/pages/login.dart';
import 'package:userphin/codilogin/pages/regis.dart';
import 'package:userphin/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  runApp(MyApp(authBloc: AuthBloc(_firebaseAuth)));
}

class MyApp extends StatelessWidget {
  final AuthBloc authBloc;
 MyApp({required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => authBloc,
        child:RegisterScreen(authBloc),
      ),
    );
  }
}