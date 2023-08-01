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
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwOTE1NTU5LCJpYXQiOjE2OTA4OTc1NTksImp0aSI6ImZmOGFiNzY5NzcyNzRjM2U5MjE1OWYzMDkwZTUzYjJlIiwidXNlcl9pZCI6NTA1fQ.GvneMK9m08ZNytlV3sQ9h1KMtgGDcA3rOKoaPSpojFs';
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
