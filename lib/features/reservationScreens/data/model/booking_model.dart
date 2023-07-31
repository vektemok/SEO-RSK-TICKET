


import 'package:json_annotation/json_annotation.dart';
part 'booking_model.g.dart';
@JsonSerializable()
class Booking {
  Booking(
      {required this.firstName,
        required this.lastName,
        required this.surname,
        required this.pasport,
        required this.phoneNumber,
        required this.time,
        required this.date,
        required this.queue});

  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  String surname;
  String pasport;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String time;
  String date;
  String queue;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}