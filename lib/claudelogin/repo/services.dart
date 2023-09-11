import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInEmail({required email, password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future signOut() async {
    await _auth.signOut();
  }

}