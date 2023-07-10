import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(responseType: ResponseType.json));
  Map<String, dynamic> branch = {
    'name': 'Egor',
    'phone': '996701330021',
    'schedule_start': '11:30:00',
    'schedule_end': '12:00:00',
    'city': 'Bishkek',
    'street': 'lala',
    'admin': 1,
    'region': null
  };

  Future<void> getBranches() async {
    final response = await _dio.get('http://35.184.55.194/branches/');
    debugPrint(response.data.toString());
  }

  Future<void> postBranches() async {
    Response response =
        await _dio.post('http://35.184.55.194/branches/', data: branch);
    debugPrint(response.statusMessage);
  }

  Future<void> getBranchesId() async {
    Response response = await _dio
        .get('http://35.184.55.194/branches/region/${0}/region_branches/');
    debugPrint(response.data.toString());
    debugPrint(response.statusCode.toString());
    debugPrint(response.statusMessage.toString());
  }

  String baseUrl = 'http://35.184.55.194/';

  Future<void> getBranchesRegion() async {
    Response response = await _dio.get('${baseUrl}branches/region/');
    debugPrint(response.data.toString());
  }



}
