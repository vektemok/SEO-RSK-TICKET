import 'dart:convert';

class ServiceModel {
  int id;
  String name;
  String phone;
  String scheduleStart;
  String scheduleEnd;
  String city;
  String street;
  int admin;
  int region;

  ServiceModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.scheduleStart,
    required this.scheduleEnd,
    required this.city,
    required this.street,
    required this.admin,
    required this.region,
  });

  factory ServiceModel.fromRawJson(String str) => ServiceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    scheduleStart: json["schedule_start"],
    scheduleEnd: json["schedule_end"],
    city: json["city"],
    street: json["street"],
    admin: json["admin"],
    region: json["region"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "schedule_start": scheduleStart,
    "schedule_end": scheduleEnd,
    "city": city,
    "street": street,
    "admin": admin,
    "region": region,
  };
}
