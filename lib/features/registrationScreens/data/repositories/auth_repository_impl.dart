import 'package:dio/dio.dart';
import 'package:united102/features/registrationScreens/data/models/client.model.dart';
import 'package:united102/features/registrationScreens/data/models/login_model.dart';
import 'package:united102/features/registrationScreens/domain/repositories/auth_repositories.dart';
import 'package:united102/iternal/api_requester.dart';

import '../../../../iternal/catch_exception_helper.dart';

class AuthRepositoryImpl implements AuthRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<LoginModel> getLogIn(String username, String password) async {
    try {
      Response response = await apiRequester.toPost(
        "/login/jwt/create/",
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        LoginModel model = LoginModel.fromJson(response.data);

        return model;
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<ClientModel> getRegistration(String email, String username, String password) async {
    try {
      Response response = await apiRequester.toPost(
        "/user/users/",
        data: {
          'email' : email,
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        ClientModel model = ClientModel.fromJson(response.data);

        return model;
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
