import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:userphin/claudelogin/repo/services.dart';

part 'auth_claude_event.dart';
part 'auth_claude_state.dart';

class AuthClaudeBloc extends Bloc<AuthClaudeEvent, AuthClaudeState> {
    final authService = AuthService();

  @override
  AuthClaudeState get initialState => AuthClaudeInitial();
  
  AuthClaudeBloc() : super(AuthClaudeInitial()) {
    on<AuthClaudeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
