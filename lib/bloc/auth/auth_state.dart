part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class LoggedOutState extends AuthState {}

class LoadingState extends AuthState {
  final String message;

  const LoadingState({
    required this.message,
  });
}

class LoginSuccess extends AuthState {
  final User? user;

  const LoginSuccess({required this.user});
}

class CheckingAuth extends AuthState {}

class LoginError extends AuthState {
  final NetworkExceptions networkExceptions;

  const LoginError({required this.networkExceptions});
}

class SecurityStampError extends AuthState {
  final String errorMessage;

  const SecurityStampError({required this.errorMessage});
}
