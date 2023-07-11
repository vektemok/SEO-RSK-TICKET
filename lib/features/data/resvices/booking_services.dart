import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../reservationScreens/data/model/booking_model.dart';

class HttpService {
  String baseUrl = 'http://35.184.55.194/booking/';

  // Fake data
  // Данные в этот обьект класса  ты должен положить для отправки пост запроса для бронированния талона.

  Booking booking = Booking(
      firstName: 'Radmir',
      lastName: 'Dorg',
      surname: 'HuiZnaet',
      pasport: 'pasport',
      phoneNumber: 'phoneNumber',
      time: '17:00:00',
      date: '2023-07-11',
      // для проверке   запроса отпрвляй запросы передими числами
      queue: 1);

  // time, date, queue,  не трогай у тебя нету этих данных пока что .
  //  остальные данные пользователь должен внести на странице date entry screen

  Future<void> postBooking() async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(booking));

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
  }

  // Это данные для получения истории талона пользоватля
  final Map<String, String> userHeaders = {
    'first_name': 'Radmir',
    'last_name': 'Dorg',
    "surname": "HuiZnaet"
  };

// запрос без сериализации
  Future<void> getProfileUserHistory() async {
    final response = await http.get(
        Uri.parse(
          'http://35.184.55.194/profile/user_history/',
        ),
        headers: userHeaders);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
  }
}
