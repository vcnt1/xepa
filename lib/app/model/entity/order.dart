// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:xepa/app/model/entity/product.dart';
import 'package:xepa/app/model/entity/store.dart';

List<Order> ordersFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.result,
    this.estabelecimento,
  });

  final Result? result;
  final Store? estabelecimento;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    result: Result.fromJson(json["result"]),
    estabelecimento: storeFromJson(json["estabelecimento"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
    "estabelecimento": estabelecimento?.toJson(),
  };
}

class Result {
  Result({
    this.id,
    this.idUsuario,
    this.idEstabelecimento,
    this.statusEstabelecimento,
    this.statusUsuario,
    this.createdAt,
    this.updatedAt,
    this.produtos,
  });

  final String? id;
  final String? idUsuario;
  final String? idEstabelecimento;
  final String? statusEstabelecimento;
  final String? statusUsuario;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Product>? produtos;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["Id"],
    idUsuario: json["Id_Usuario"],
    idEstabelecimento: json["Id_Estabelecimento"],
    statusEstabelecimento: json["Status_estabelecimento"],
    statusUsuario: json["Status_usuario"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    produtos: productsFromJson(json["produtos"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Id_Usuario": idUsuario,
    "Id_Estabelecimento": idEstabelecimento,
    "Status_estabelecimento": statusEstabelecimento,
    "Status_usuario": statusUsuario,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "produtos": List<dynamic>.from(produtos!.map((x) => x.toJson())),
  };
}
