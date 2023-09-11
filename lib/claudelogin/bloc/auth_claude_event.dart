part of 'auth_claude_bloc.dart';

sealed class AuthClaudeEvent extends Equatable {
  const AuthClaudeEvent();

  @override
  List<Object> get props => [];
}

class LoginClaudeEvent extends AuthClaudeEvent {} 

class LogoutClaudeEvent extends AuthClaudeEvent {}