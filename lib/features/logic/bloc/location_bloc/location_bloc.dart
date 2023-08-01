import 'dart:async';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:united102/features/appNavigator/mainScreen/main_screen.dart';
import 'package:united102/features/pageListScreens/presentation/data/model/location_model.dart';
import 'package:united102/features/reservationScreens/presentation/screens/SerivcePointScreen/service_point_screen.dart';
import 'package:united102/iternal/helpers/enpoints.dart';
import 'package:united102/iternal/helpers/shared_preferencies_helper.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<LocationFetch>((event, emit) async {
      final Dio dio = Dio();
      final response = await dio.get(Endpoints.branchesRegion);

      emit(
          LocationLoaded(locationModel: LocationModel.fromJson(response.data)));
    });

    on<SaveRegionId>((event, emit) {
      EndpointsKeyShared().saveRegionId(event.id);
      Navigator.push(
          event.context,
          MaterialPageRoute(
              builder: (context) => ServicePointScreen(regionId: event.id)));
    });
  }
}
