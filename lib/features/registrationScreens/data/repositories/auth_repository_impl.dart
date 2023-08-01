import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../iternal/api_requester.dart';
import '../../../../iternal/catch_exception_helper.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../models/client.model.dart';
import '../models/login_model.dart';

@Injectable(as: AuthRepository)
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
      log(response.data);
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<ClientModel> getRegistration(
      String email, String username, String password) async {
    try {
      Response response = await apiRequester.toPost(
        "users/",
        data: {
          "email": email,
          "username": username,
          "password": password,
        },
      );
      log('real url == ${response.realUri}');
      log("dsadsads ${response.statusCode}");
      if (response.statusCode == 201) {
        log(response.data.toString());
        ClientModel model = ClientModel.fromJson(response.data);

        return model;
      }
      throw response;
    } on DioException catch (e) {
      
      log("errrrr ${e.message.toString()}");
      throw CatchException.convertException(e);
    } catch (e) {
      log('e == ${e}');
      throw CatchException.convertException(e);
    }
  }
}
