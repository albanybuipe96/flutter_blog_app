part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class AuthSignup extends AuthEvent {
  const AuthSignup({
    required this.username,
    required this.email,
    required this.password,
  });

  final String username;
  final String email;
  final String password;
}
