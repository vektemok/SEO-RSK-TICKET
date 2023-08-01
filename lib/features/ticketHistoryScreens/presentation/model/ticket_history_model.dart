// To parse this JSON data, do
//
//     final tokenHistory = tokenHistoryFromJson(jsonString);

import 'dart:convert';

class TokenHistory {
  int id;
  String ticketNumber;
  String queue;
  int waitingTime;
  String category;
  int position;
  dynamic isServed;

  TokenHistory({
    required this.id,
    required this.ticketNumber,
    required this.queue,
    required this.waitingTime,
    required this.category,
    required this.position,
    this.isServed,
  });

  factory TokenHistory.fromRawJson(String str) => TokenHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TokenHistory.fromJson(Map<String, dynamic> json) => TokenHistory(
    id: json["id"],
    ticketNumber: json["ticket_number"],
    queue: json["queue"],
    waitingTime: json["waiting_time"],
    category: json["category"],
    position: json["position"],
    isServed: json["is_served"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ticket_number": ticketNumber,
    "queue": queue,
    "waiting_time": waitingTime,
    "category": category,
    "position": position,
    "is_served": isServed,
  };
}
