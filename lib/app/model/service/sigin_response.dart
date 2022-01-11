// To parse this JSON data, do
//
//     final siginResponse = siginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:xepa/app/model/entity/user.dart';

SiginResponse siginResponseFromJson(String str) => SiginResponse.fromJson(json.decode(str));

String siginResponseToJson(SiginResponse data) => json.encode(data.toJson());

class SiginResponse {
  SiginResponse({
    required this.result,
    required this.token,
  });

  final User result;
  final String token;

  factory SiginResponse.fromJson(Map<String, dynamic> json) => SiginResponse(
    result: User.fromJson(json["result"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
    "token": token,
  };
}
