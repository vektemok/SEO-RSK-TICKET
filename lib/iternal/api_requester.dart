import 'dart:developer';

import 'package:dio/dio.dart';

import 'catch_exception_helper.dart';

class ApiRequester {
  final String url = 'http://35.184.55.194';

  

  Future<Dio> initDio() async {

    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Authorization": "token",
        },
      ),
    );
  }

  Future<Response> toGet(
    String url, {
    Map<String, dynamic>? param,
    Map<String, dynamic>? data,
  }) async {
    Dio dio = await initDio();

    try {
      return dio.get(url, data: data);
    } catch (e) {
      log('get error ==== $e');

      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(
    String url, {
    Map<String, dynamic>? param,
    Map<String, dynamic>? data,
  }) async {
    Dio dio = await initDio();

    try {
      return dio.post(url, queryParameters: param, data: data);
    } catch (e) {
      log('post error ==== $e');

      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPatch(String url,
      {Map<String, dynamic>? param, data}) async {
    Dio dio = await initDio();

    try {
      return dio.patch(
        url,
        queryParameters: param,
        data: data,
      );
    } catch (e) {
      log('patch error ==== $e');

      throw CatchException.convertException(e);
    }
  }
}
