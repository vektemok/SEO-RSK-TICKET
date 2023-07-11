// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'data_entry_bloc.dart';

abstract class DataEntryState {}

class DataEntryInitial extends DataEntryState {}

class DataEntryLoadingState extends DataEntryState {}

class DataEntryFailedState extends DataEntryState {
  final CatchException error;

  DataEntryFailedState({required this.error});
}

class DataEntryLoadeddState extends DataEntryState {
  final BookingModel bookingModel;
  DataEntryLoadeddState({
    required this.bookingModel,
  });
}
