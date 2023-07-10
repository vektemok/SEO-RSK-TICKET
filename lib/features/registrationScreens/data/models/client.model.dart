import 'dart:convert';

class ClientModel {
    String? email;
    String? username;
    int? id;

    ClientModel({
        this.email,
        this.username,
        this.id,
    });

    factory ClientModel.fromRawJson(String str) => ClientModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        email: json["email"],
        username: json["username"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "id": id,
    };
}
