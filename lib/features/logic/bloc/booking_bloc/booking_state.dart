part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingRequestCompleted extends BookingState {
  BookingRequestCompleted({required this.responseBooking});
  ResponseBooking responseBooking;
}
