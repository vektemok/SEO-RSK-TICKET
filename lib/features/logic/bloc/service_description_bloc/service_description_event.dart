part of 'service_description_bloc.dart';

@immutable
abstract class ServiceDescriptionEvent {}



class ServiceDescriptionFetch extends ServiceDescriptionEvent{
  ServiceDescriptionFetch({required this.serviceId, required this.branchId});
  final int serviceId;
  final int branchId;

}
