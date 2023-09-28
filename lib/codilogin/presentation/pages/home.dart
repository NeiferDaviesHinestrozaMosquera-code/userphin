import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:userphin/codilogin/utils/const.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
    return Scaffold(
      body: Row(
        children: [
            Center(
            child: Text("Hola mundo"),
            ),
            ElevatedButton(
  child: Text('Cerrar sesión'),
  onPressed: () async {
    getAnimatedSnackbarSuccess("Hasta luego", context);
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    Navigator.pushNamed(context, '/login');
  },
)

          ],
      ),
        
    );
  }
}