part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginButtonPressed extends AuthEvent {
  final String email;
  final String password;

  AuthLoginButtonPressed({
    required this.email,
    required this.password,
  });
}

final class AuthLogoutButtonPressed extends AuthEvent {}
