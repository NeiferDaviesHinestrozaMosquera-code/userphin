import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController _passwordController;

  PasswordFormField(this._passwordController);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}


class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _passwordControllerVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: widget._passwordController,
      obscureText: !_passwordControllerVisible,
      
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscuringCharacter: "*",
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        RegExp regex = RegExp(r'^.{8,}$');
        if (value!.isEmpty) {
          return ("Contraseña es requerida para inicializar sesion");
        }
        if (!regex.hasMatch(value)) {
          return ("Escriba una contraseña con almenos 8 caracteres");
        }
      },
      decoration: InputDecoration(
        icon: const Icon(
          Icons.security,
        ), 
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(40),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordControllerVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _passwordControllerVisible = !_passwordControllerVisible;
            });
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        labelText: "Ingrese su contraseña",
      ),
    );
  }
}
