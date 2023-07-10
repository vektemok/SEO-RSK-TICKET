// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:united102/features/registrationScreens/data/models/login_model.dart';

import 'package:united102/features/registrationScreens/domain/repositories/auth_repositories.dart';

import '../../data/models/client.model.dart';

@injectable
class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  Future<ClientModel> getRegistration(String email, String username, String password,) async =>
      await authRepository.getRegistration(email, username, password);

  Future<LoginModel> getLogIn(String username, String password) async =>
      await authRepository.getLogIn(username, password);
}

