// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// part 'register_event.dart';
// part 'register_state.dart';

// class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
//   final FirebaseAuth _firebaseAuth;
//   UserCredential? signUp;

//   RegisterBloc(this._firebaseAuth) : super(RegisterInitial()) {
//     on<RegisterEvent>((event, emit) async {
//       emit(RegisterLoading());
//       try {
//        signUp = await _firebaseAuth.createUserWithEmailAndPassword(
          
//           email: event.email,
//           password: event.password,
//        ) 
//        .onError((error, stackTrace) {
//          emit(RegisterFailure(error.toString()));

//          return Future.value(null);
//        },);
//         emit(RegisterLoggedIn()); // Changed from RegisterSuccess to RegisterLoggedIn
//       } catch (error) {
//         emit(RegisterFailure(error.toString()));
//       }
//     });
//   }
//  /// Other methods and event handlers
// }

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final FirebaseAuth _firebaseAuth;

  RegisterBloc(this._firebaseAuth) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        UserCredential signUp = await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        ).catchError((error) {
          emit(RegisterFailure(error.message)); // Use error.message to get a more user-friendly error message
        });

        if (signUp != null) {
          // You might want to verify the email before considering the user as logged in
          // For example:
          // if (signUp.user != null && !signUp.user!.emailVerified) {
          //   await signUp.user!.sendEmailVerification();
          // }

          emit(RegisterLoggedIn());
        }
      } catch (error) {
        emit(RegisterFailure('An error occurred. Please try again latery.'));
      }
    });
  }
  /// Other methods and event handlers
}
