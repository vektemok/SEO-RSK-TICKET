import 'dart:convert';

class LoginModel {
    String? refresh;
    String? access;

    LoginModel({
        this.refresh,
        this.access,
    });

    factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        refresh: json["refresh"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
    };
}