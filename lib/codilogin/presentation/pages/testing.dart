import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool isLoginMode = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(isLoginMode ? 'Iniciar sesión' : 'Registrarse'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 Padding(padding:  const EdgeInsets.only(left: 15, top: 15),
//                 child: Image.asset(
//                   "assets/vector-1.png",
//                   width: 413,
//                   height: 257,
//                 ),),
//                 SizedBox(height: 20,),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Correo electrónico',
//                   ),
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Contraseña',
//                   ),
//                   obscureText: true,
//                 ),
//                 SwitchListTile(
//                   title: Text('¿Nuevo usuario?'),
//                   value: !isLoginMode,
//                   onChanged: (bool value) {
//                     setState(() {
//                       isLoginMode = !value;
//                     });
//                   },
//                 ),
//                 TextButton(
//                   child: Text(isLoginMode ? 'Iniciar sesión' : 'Registrarse'),
//                   onPressed: () {
//                     // Handle login or register
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Image.asset(
              'assets/image.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón de inicio de sesión
                    },
                    child: Text('Iniciar sesión'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
