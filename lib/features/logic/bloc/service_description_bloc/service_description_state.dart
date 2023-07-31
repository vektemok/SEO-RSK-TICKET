part of 'service_description_bloc.dart';

@immutable
abstract class ServiceDescriptionState {}

class ServiceDescriptionInitial extends ServiceDescriptionState {}

class ServiceDescriptionError extends ServiceDescriptionState {}

class ServiceDescriptionLoaded extends ServiceDescriptionState {
  ServiceDescriptionLoaded({required this.serviceDescription});

  final List<ServiceDescriptionModel> serviceDescription;
}
