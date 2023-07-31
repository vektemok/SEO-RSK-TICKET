part of 'service_point_bloc.dart';

@immutable
abstract class ServicePointState {}


class ServicePointInitial extends ServicePointState {}
class ServicePointLoaded extends ServicePointState {
  ServicePointLoaded({required this.servceModel});
  final List<ServiceModel> servceModel;
}



