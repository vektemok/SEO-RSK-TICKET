// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

class BookingModel {
    String? firstName;
    String? lastName;
    String? surname;
    String? pasport;
    String? phoneNumber;
    String? time;
    DateTime? date;
    int? queue;

    BookingModel({
        this.firstName,
        this.lastName,
        this.surname,
        this.pasport,
        this.phoneNumber,
        this.time,
        this.date,
        this.queue,
    });

    factory BookingModel.fromRawJson(String str) => BookingModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        surname: json["surname"],
        pasport: json["pasport"],
        phoneNumber: json["phone_number"],
        time: json["time"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        queue: json["queue"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "surname": surname,
        "pasport": pasport,
        "phone_number": phoneNumber,
        "time": time,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "queue": queue,
    };
}
