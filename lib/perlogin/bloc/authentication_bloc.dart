import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:userphin/perlogin/auth/auth_repo.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc({required AuthenticationRepository authenticationRepository})
      : authenticationRepository = authenticationRepository,
        super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield Loading();
      try {
        final isSignedIn = await authenticationRepository.isSignedIn();
        if (isSignedIn) {
          yield Authenticated();
        } else {
          yield Unauthenticated();
        }
      } catch (_) {
        yield Unauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield Loading();
      try {
        await authenticationRepository.logIn(email: '', password: '');
        yield Authenticated();
      } catch (_) {
        yield Unauthenticated();
      }
    }

    if (event is LoggedOut) {
      yield Loading();
      try {
        await authenticationRepository.logOut();
        yield Unauthenticated();
      } catch (_) {
        yield Authenticated();
      }
    }
  }
}