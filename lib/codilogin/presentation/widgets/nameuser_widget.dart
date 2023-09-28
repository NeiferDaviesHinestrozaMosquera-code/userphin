import 'package:flutter/material.dart';

class UserNameFormField extends StatelessWidget {
  final TextEditingController _usernameController;


  UserNameFormField(this._usernameController);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      decoration: InputDecoration(
        labelText: 'Nombre de usuario',
        icon: Icon(Icons.person),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(40),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{4,}$');
        if (value!.isEmpty) {
          return ("Por favor escribir nombre de usuario");
        }
        if (!regex.hasMatch(value)) {
          return ("Escriba una nombre de usuario con almenos 4 caracteres");
        }
        return null;
      },
      onSaved: (value) {
        _usernameController.text = value!;
      },
    );
  }
}


