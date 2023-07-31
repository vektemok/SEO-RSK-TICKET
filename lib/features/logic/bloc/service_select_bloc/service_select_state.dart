part of 'service_select_bloc.dart';

@immutable
abstract class ServiceSelectState {}

class ServiceSelectInitial extends ServiceSelectState {}

class ServiceSelectLoaded extends ServiceSelectState {
  ServiceSelectLoaded({required this.service});

  final List<ServiceSelectionModel> service;
}
