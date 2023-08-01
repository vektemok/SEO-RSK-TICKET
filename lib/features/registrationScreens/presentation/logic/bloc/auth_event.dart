// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LogInEvent extends AuthEvent {
  final String password;
  final String email;

  LogInEvent({
    
    required this.email,
     required this.password,
  });
}

class RegistrationEvent extends AuthEvent {
  final String email;
  final String name;
  final String password; 

  RegistrationEvent({
    required this.email,
    required this.name,
    required this.password,
  });

}
