import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
            Center(
            child: Text("Hola mundo"),
            ),
            ElevatedButton(
  child: Text('Cerrar sesión'),
  onPressed: () async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, '/login');
  },
)

          ],
      ),
        
    );
  }
}