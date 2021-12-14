// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.name,
    required this.description,
    required this.about,
    required this.quantity,
    required this.oldPrice,
    required this.price,
  });

  final String name;
  final String description;
  final String about;
  final int quantity;
  final double oldPrice;
  final double price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        description: json["description"],
        about: json["about"],
        quantity: json["quantity"],
        oldPrice: json["old_price"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "about": about,
        "quantity": quantity,
        "old_price": oldPrice,
        "price": price,
      };
}
