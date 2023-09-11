import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthBlocPoe extends Cubit<User?> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBlocPoe() : super(null);

  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(_firebaseAuth.currentUser);
    } catch (e) {
      emit(null);
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    emit(null);
  }
}