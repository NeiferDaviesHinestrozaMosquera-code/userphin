// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:equatable/equatable.dart';

// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final FirebaseAuth _firebaseAuth;

//   LoginBloc({required this._firebaseAuth});

//   @override
//   LoginState get initialState => LoginState(isLoading: false);

//   @override
//   Stream<LoginState> mapEventToState(LoginEvent event) async* {
//     if (event is LoginEventSuccess) {
//       final FirebaseUser user = await _firebaseAuth.signInWithCredential(event.credentials);
//       yield LoginState(isLoading: false, user: user);
//     } else if (event is LoginEventFailure) {
//       yield LoginState(isLoading: false, error: event.error);
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _firebaseAuth.dispose();
//   }
// }

