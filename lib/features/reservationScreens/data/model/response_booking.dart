import 'package:json_annotation/json_annotation.dart';

part 'response_booking.g.dart';

@JsonSerializable()
class ResponseBooking {
  ResponseBooking(
      {required this.id,
      required this.pin,
      required this.firstName,
      required this.lastName,
      required this.surname,
      required this.pasport,
      required this.phoneNumber,
      required this.time,
      required this.date,
      required this.isRegistered,
      required this.createdAt,
      required this.queue,
      required this.user});

  int id;
  int pin;
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
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'is_registered')
  bool isRegistered;
  int queue;
  int user;

  factory ResponseBooking.fromJson(Map<String, dynamic> json) =>
      _$ResponseBookingFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseBookingToJson(this);
}
