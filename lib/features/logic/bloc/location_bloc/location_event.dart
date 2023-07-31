part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

class LocationFetch extends LocationEvent {}

class SaveRegionId extends LocationEvent {

  SaveRegionId({required this.id, required this.context});
 final int id;
 final context;


}
