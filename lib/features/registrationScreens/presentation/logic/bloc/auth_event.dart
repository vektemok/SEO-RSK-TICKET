// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class RegistrationEvent extends AuthEvent {
  final String email;
  final String username;
  final String password;
  RegistrationEvent({
    required this.email,
    required this.username,
    required this.password,
  });
}

class LogInEvent extends AuthEvent {
  final String username;
  final String password;
  LogInEvent({
    required this.username,
    required this.password,
  });
}
