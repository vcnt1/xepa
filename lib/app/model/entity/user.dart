// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  const User({
    required this.id,
    required this.nome,
    required this.email,
    this.senha,
    required this.tipo,
    this.updatedAt,
    this.createdAt,
  });

  static const empty = User(id: '', nome: '', email: '', senha: '', tipo: '');

  final String id;
  final String nome;
  final String email;
  final String? senha;
  final String tipo;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["Id"],
    nome: json["Nome"],
    email: json["Email"],
    senha: json["Senha"],
    tipo: json["Tipo"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Nome": nome,
    "Email": email,
    "Senha": senha,
    "Tipo": tipo,
    "updatedAt": updatedAt?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
  };
}
