import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:united102/features/reservationScreens/data/model/service_model.dart';
import 'package:united102/features/reservationScreens/presentation/screens/SerivcePointScreen/service_point_screen.dart';

import '../../../serviceSelectionScreens/presentation/ServiceSelectScreen/service_select_screen.dart';

part 'service_point_event.dart';

part 'service_point_state.dart';

class ServicePointBloc extends Bloc<ServicePointEvent, ServicePointState> {
  ServicePointBloc() : super(ServicePointInitial()) {
    on<ServicePointFetch>((event, emit) async {
      final Dio dio = Dio();
      final response = await dio.get(
          'http://35.228.114.191/branches/region/${event.regionId}/region_branches/');
      List<dynamic> jsonList = response.data;
      emit(ServicePointLoaded(
          servceModel:
              jsonList.map((json) => ServiceModel.fromJson(json)).toList()));
    });

    on<FetchServicePointId>((event, emit) {
      Navigator.push(
          event.context,
          MaterialPageRoute(
              builder: (context) => ServiceSelectScreen(
                    serviceId: event.id,
                  )));
      emit(ServicePointInitial());
    });
  }
}
