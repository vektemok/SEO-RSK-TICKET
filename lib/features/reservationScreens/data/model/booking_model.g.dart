// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      surname: json['surname'] as String,
      pasport: json['pasport'] as String,
      phoneNumber: json['phone_number'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
      queue: json['queue'] as int,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'surname': instance.surname,
      'pasport': instance.pasport,
      'phone_number': instance.phoneNumber,
      'time': instance.time,
      'date': instance.date,
      'queue': instance.queue,
    };
