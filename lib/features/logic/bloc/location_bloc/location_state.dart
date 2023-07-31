part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoaded extends LocationState {
  LocationLoaded({required this.locationModel});

  final LocationModel locationModel;
}
