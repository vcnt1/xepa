// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

List<Store> storesFromJson(String str) => List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

Store storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store data) => json.encode(data.toJson());

class Store {
  Store({
    this.id,
    this.idUsuario,
    this.nome,
    this.imagem,
    this.tipo,
    this.logradouro,
    this.bairro,
    this.localidade,
    this.uf,
    this.cep,
    this.complemento,
    this.numero,
    this.telefone,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? idUsuario;
  final String? nome;
  final String? imagem;
  final String? tipo;
  final String? logradouro;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? cep;
  final String? complemento;
  final String? numero;
  final String? telefone;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["Id"],
    idUsuario: json["Id_Usuario"],
    nome: json["Nome"],
    imagem: json["Imagem"],
    tipo: json["Tipo"],
    logradouro: json["Logradouro"],
    bairro: json["Bairro"],
    localidade: json["Localidade"],
    uf: json["Uf"],
    cep: json["Cep"],
    complemento: json["Complemento"],
    numero: json["Numero"],
    telefone: json["Telefone"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Id_Usuario": idUsuario,
    "Nome": nome,
    "Imagem": imagem,
    "Tipo": tipo,
    "Logradouro": logradouro,
    "Bairro": bairro,
    "Localidade": localidade,
    "Uf": uf,
    "Cep": cep,
    "Complemento": complemento,
    "Numero": numero,
    "Telefone": telefone,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
