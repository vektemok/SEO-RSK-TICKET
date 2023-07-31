part of 'service_select_bloc.dart';

@immutable
abstract class ServiceSelectEvent {}

class ServiceFetch extends ServiceSelectEvent {
  ServiceFetch({required this.serviceId});

  final int serviceId;
}
