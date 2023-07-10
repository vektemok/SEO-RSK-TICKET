// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final CatchException error;

  AuthErrorState({required this.error});
}

class SuccessLogInState extends AuthState {
  final LoginModel loginmodel;

  SuccessLogInState({required this.loginmodel});
}

class SuccessRegistrationState extends AuthState {
  final ClientModel regModel;

  SuccessRegistrationState({required this.regModel});
}


class SuccessRegistrationLoadedState extends AuthState {}