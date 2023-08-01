part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SuccessLogInState extends AuthState {
  final LoginModel loginModel;

  SuccessLogInState({
    required this.loginModel,
  });
}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final CatchException error;

  AuthErrorState({required this.error});
}

class SuccessLogoutState extends AuthState {}

class SuccessRegistatrionLoadedState extends AuthState {}

