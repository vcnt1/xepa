// To parse this JSON data, do
//
//     final Order = OrderFromJson(jsonString);

import 'dart:convert';

import 'package:xepa/app/model/entity/barrel.dart';

List<Order> ordersFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String OrderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    required this.id,
    required this.idUsuario,
    required this.idEstabelecimento,
    required this.statusEstabelecimento,
    required this.statusUsuario,
    required this.createdAt,
    required this.updatedAt,
    required this.estabelecimentos,
    required this.produtos,
  });

  final String id;
  final String idUsuario;
  final String idEstabelecimento;
  final String statusEstabelecimento;
  final String statusUsuario;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Store estabelecimentos;
  final List<Produto> produtos;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["Id"],
    idUsuario: json["Id_Usuario"],
    idEstabelecimento: json["Id_Estabelecimento"],
    statusEstabelecimento: json["Status_estabelecimento"],
    statusUsuario: json["Status_usuario"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    estabelecimentos: Store.fromJson(json["estabelecimentos"]),
    produtos: List<Produto>.from(json["produtos"].map((x) => Produto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Id_Usuario": idUsuario,
    "Id_Estabelecimento": idEstabelecimento,
    "Status_estabelecimento": statusEstabelecimento,
    "Status_usuario": statusUsuario,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "estabelecimentos": estabelecimentos.toJson(),
    "produtos": List<dynamic>.from(produtos.map((x) => x.toJson())),
  };
}

class Produto {
  Produto({
    required this.id,
    required this.idEstabelecimento,
    required this.nome,
    required this.descricao,
    required this.imagem,
    required this.tipo,
    required this.data,
    required this.peso,
    required this.precoOriginal,
    required this.precoPromocional,
    required this.desconto,
    required this.estoque,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
    required this.compraProduto,
  });

  final String id;
  final String idEstabelecimento;
  final String nome;
  final String descricao;
  final String imagem;
  final String tipo;
  final DateTime data;
  final int peso;
  final double precoOriginal;
  final double precoPromocional;
  final int desconto;
  final int estoque;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CompraProduto compraProduto;

  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
    id: json["Id"],
    idEstabelecimento: json["Id_Estabelecimento"],
    nome: json["Nome"],
    descricao: json["Descricao"] ?? '',
    imagem: json["Imagem"],
    tipo: json["Tipo"],
    data: DateTime.parse(json["Data"]),
    peso: json["Peso"],
    precoOriginal: json["Preco_Original"].toDouble(),
    precoPromocional: json["Preco_Promocional"].toDouble(),
    desconto: json["Desconto"],
    estoque: json["Estoque"],
    startTime: DateTime.parse(json["StartTime"]),
    endTime: DateTime.parse(json["EndTime"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    compraProduto: CompraProduto.fromJson(json["compra-produto"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Id_Estabelecimento": idEstabelecimento,
    "Nome": nome,
    "Descricao": descricao,
    "Imagem": imagem,
    "Tipo": tipo,
    "Data": data.toIso8601String(),
    "Peso": peso,
    "Preco_Original": precoOriginal,
    "Preco_Promocional": precoPromocional,
    "Desconto": desconto,
    "Estoque": estoque,
    "StartTime": startTime.toIso8601String(),
    "EndTime": endTime.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "compra-produto": compraProduto.toJson(),
  };
}

class CompraProduto {
  CompraProduto({
    required this.quantidade,
  });

  final int quantidade;

  factory CompraProduto.fromJson(Map<String, dynamic> json) => CompraProduto(
    quantidade: json["Quantidade"],
  );

  Map<String, dynamic> toJson() => {
    "Quantidade": quantidade,
  };
}
