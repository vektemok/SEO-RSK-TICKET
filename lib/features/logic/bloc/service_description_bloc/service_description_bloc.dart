import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import '../../../serviceSelectionScreens/presentation/ServiceDescriptionScreen/model/service_description_model.dart';

part 'service_description_event.dart';

part 'service_description_state.dart';

class ServiceDescriptionBloc
    extends Bloc<ServiceDescriptionEvent, ServiceDescriptionState> {
  ServiceDescriptionBloc() : super(ServiceDescriptionInitial()) {
    on<ServiceDescriptionFetch>((event, emit) async {
      final Dio dio = Dio();
      final response = await dio.get(
          'http://35.228.114.191/branch/${event.branchId}/${event.serviceId}/service_queues/');
      final List<dynamic> jsonList = response.data;

      emit(ServiceDescriptionLoaded(
          serviceDescription: jsonList
              .map((json) => ServiceDescriptionModel.fromJson(json))
              .toList()));
    });
  }
}
