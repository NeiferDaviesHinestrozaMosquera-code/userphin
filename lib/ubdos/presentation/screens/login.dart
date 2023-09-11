import 'package:flutter/material.dart';
import 'package:userphin/ubdos/presentation/widgets/form_widget.dart';
import 'package:userphin/ubdos/presentation/widgets/login_widget.dart';

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Digamos que es un login"),
      ),
      body: Column(
        children: [
          Text("Voy perdido")
        ],
      ),
    );
  }
}