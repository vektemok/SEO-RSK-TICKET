// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseBooking _$ResponseBookingFromJson(Map<String, dynamic> json) =>
    ResponseBooking(
      id: json['id'] as int,
      pin: json['pin'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      surname: json['surname'] as String,
      pasport: json['pasport'] as String,
      phoneNumber: json['phone_number'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
      isRegistered: json['is_registered'] as bool,
      createdAt: json['created_at'] as String,
      queue: json['queue'] as int,
      user: json['user'] as int,
    );

Map<String, dynamic> _$ResponseBookingToJson(ResponseBooking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pin': instance.pin,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'surname': instance.surname,
      'pasport': instance.pasport,
      'phone_number': instance.phoneNumber,
      'time': instance.time,
      'date': instance.date,
      'created_at': instance.createdAt,
      'is_registered': instance.isRegistered,
      'queue': instance.queue,
      'user': instance.user,
    };
