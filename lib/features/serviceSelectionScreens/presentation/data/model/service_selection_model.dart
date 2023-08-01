// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

class ServiceSelectionModel {
  int id;
  String name;

  ServiceSelectionModel({
    required this.id,
    required this.name,
  });

  factory ServiceSelectionModel.fromRawJson(String str) => ServiceSelectionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceSelectionModel.fromJson(Map<String, dynamic> json) => ServiceSelectionModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
