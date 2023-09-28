import 'package:flutter/material.dart';
import 'package:userphin/codilogin/utils/const.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController _emailController;

  EmailFormField(this._emailController);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        icon: Icon(Icons.email_outlined),
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
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor escriba un correo electronico valido");
        }
        // reg expression for email validation
        else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Por favor escriba un correo electronico valido");
        }
        return null;
      },
      onSaved: (value) {
        _emailController.text = value!;
      },
    );
  }
}


