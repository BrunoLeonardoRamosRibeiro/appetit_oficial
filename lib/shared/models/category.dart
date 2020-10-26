// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.categoria,
  });

  String categoria;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoria: json["categoria"],
  );

  Map<String, dynamic> toJson() => {
    "categoria": categoria,
  };
}
