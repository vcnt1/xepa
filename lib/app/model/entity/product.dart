// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productsFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.idEstabelecimento,
    this.nome,
    this.descricao,
    this.imagem,
    this.tipo,
    this.data,
    this.peso,
    this.precoOriginal,
    this.desconto,
    this.precoPromocional,
    this.quantidade,
    this.StartTime,
    this.EndTime,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? idEstabelecimento;
  final String? nome;
  final String? descricao;
  final String? imagem;
  final String? tipo;
  final DateTime? data;
  final int? peso;
  final double? desconto;
  final double? precoOriginal;
  final double? precoPromocional;
  final int? quantidade;
  final DateTime? StartTime;
  final DateTime? EndTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["Id"],
    idEstabelecimento: json["Id_Estabelecimento"],
    nome: json["Nome"],
    descricao: json["Descricao"],
    imagem: json["Imagem"],
    tipo: json["Tipo"],
    data: DateTime.parse(json["Data"]),
    peso: json["Peso"],
    desconto: json["Desconto"]?.toDouble(),
    precoOriginal: json["Preco_Original"].toDouble(),
    precoPromocional: json["Preco_Promocional"].toDouble(),
    quantidade: json["Quantidade"],
    StartTime: json["StartTime"] == null ? json["StartTime"] : DateTime.parse(json["StartTime"]),
    EndTime: json["EndTime"] == null ? json["EndTime"] : DateTime.parse(json["EndTime"]),
    createdAt: DateTime.parse(json["createdAt"] ?? ''),
    updatedAt: DateTime.parse(json["updatedAt"] ?? ''),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Id_Estabelecimento": idEstabelecimento,
    "Nome": nome,
    "Descricao": descricao,
    "Imagem": imagem,
    "Tipo": tipo,
    "Data": data?.toIso8601String(),
    "Peso": peso,
    "Desconto": desconto,
    "Preco_Original": precoOriginal,
    "Preco_Promocional": precoPromocional,
    "Quantidade": quantidade,
    "StartTime": createdAt?.toIso8601String(),
    "EndTime": createdAt?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
