import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:united102/features/reservationScreens/data/model/booking_model.dart';
import 'package:united102/features/reservationScreens/data/model/response_booking.dart';

part 'booking_event.dart';

part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<PostBookingEvent>((event, emit) async {
      emit(BookingLoading());
      Booking booking = Booking(
          firstName: event.firstName,
          lastName: event.lastName,
          surname: event.surname,
          pasport: event.passport,
          phoneNumber: event.phoneNumber,
          time: event.time,
          date: event.date,
          queue: event.queue);
      final String toker =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwODk2OTAyLCJpYXQiOjE2OTA4Nzg5MDIsImp0aSI6ImFjZjRmMzA1NTMzMTQ3ZWJhNmZkZWU3Y2MxYWYzNzFlIiwidXNlcl9pZCI6NTA1fQ.5drK0jnavE9m4j8VCelPpOWBvGpVB9NXQPW2IG2vL0k';
      try {
        final response = await http.post(
            Uri.parse('http://35.228.114.191/booking/'),
            headers: {'Authorization': 'Token $toker'},
            body: booking.toJson());
        if (response.statusCode == 200) {
          emit(BookingRequestCompleted(
              responseBooking:
                  ResponseBooking.fromJson(jsonDecode(response.body))));

          debugPrint(response.body);
        } else {
          emit(BookingError());
          debugPrint(response.body);
        }
      } catch (e) {
        emit(BookingError());
        print(e.toString());
      }
    });
  }
}
