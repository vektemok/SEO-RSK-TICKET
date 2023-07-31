part of 'service_point_bloc.dart';

@immutable
abstract class ServicePointEvent {}

class ServicePointFetch extends ServicePointEvent {
  ServicePointFetch({required this.regionId});

  int regionId;
}

class FetchServicePointId extends ServicePointEvent {
  FetchServicePointId({required this.id, required this.context});

  final context;
  final int id;
}
