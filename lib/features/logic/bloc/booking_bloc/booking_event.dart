part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class PostBookingEvent extends BookingEvent {
  PostBookingEvent(
      {required this.firstName,
      required this.lastName,
      required this.surname,
      required this.phoneNumber,
      required this.time,
      required this.passport,
      required this.queue,
      required this.date});

  String firstName;
  String lastName;
  String surname;
  String passport;
  String phoneNumber;
  String time;
  String date;
  String queue;
}
