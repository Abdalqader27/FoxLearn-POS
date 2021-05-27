part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String userName;
  final String password;

  const LoginEvent(this.userName, this.password);
}

class LogoutEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class SecurityStampErrorEvent extends AuthEvent {}
