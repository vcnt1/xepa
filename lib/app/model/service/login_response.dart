// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:xepa/app/model/entity/barrel.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.status,
    this.result,
    this.token,
  });

  final int? status;
  final User? result;
  final String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    result: User.fromJson(json["result"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result?.toJson(),
    "token": token,
  };
}
