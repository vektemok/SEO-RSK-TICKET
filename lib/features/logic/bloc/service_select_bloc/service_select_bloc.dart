import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:united102/features/reservationScreens/data/model/service_model.dart';
import 'package:dio/dio.dart';

import '../../../serviceSelectionScreens/presentation/data/model/service_selection_model.dart';

part 'service_select_event.dart';

part 'service_select_state.dart';

class ServiceSelectBloc extends Bloc<ServiceSelectEvent, ServiceSelectState> {
  ServiceSelectBloc() : super(ServiceSelectInitial()) {
    on<ServiceFetch>((event, emit) async {
      final Dio dio = Dio();

      final response = await dio.get(
          'http://35.228.114.191/branches/${event.serviceId}/get_service_types/');
      print(response.data);
      List<dynamic> jsonList = response.data;
      emit(ServiceSelectLoaded(
          service:
              jsonList.map((json) => ServiceSelectionModel.fromJson(json)).toList()));
    });
  }
}
