part of 'auth_claude_bloc.dart';

sealed class AuthClaudeState extends Equatable {
  const AuthClaudeState();
  
  @override
  List<Object> get props => [];
}

final class AuthClaudeInitial extends AuthClaudeState {}

class AuthClaudeenticated extends AuthClaudeState {}

class UnaClaudeuthenticated extends AuthClaudeState {}