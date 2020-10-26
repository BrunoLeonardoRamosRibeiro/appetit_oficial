// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.codigoproduto,
    this.produto,
    this.preco,
    this.imagem,
    this.categoria,
    this.descricao,
    this.opcoes,
    this.pesquisa,
  });

  String codigoproduto;
  String produto;
  double preco;
  String imagem;
  String categoria;
  String descricao;
  List<String> opcoes;
  String pesquisa;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    codigoproduto: json["codigoproduto"],
    produto: json["produto"],
    preco: json["preco"].toDouble(),
    imagem: json["imagem"],
    categoria: json["categoria"],
    descricao: json["descricao"],
    opcoes: List<String>.from(json["opcoes"].map((x) => x)),
      pesquisa: json["descricao"]+' '+ json["categoria"]+ ' '+json["produto"]
  );

  Map<String, dynamic> toJson() => {
    "codigoproduto": codigoproduto,
    "produto": produto,
    "preco": preco,
    "imagem": imagem,
    "categoria": categoria,
    "descricao": descricao,
    "opcoes": List<dynamic>.from(opcoes.map((x) => x)),
    "pesquisa": pesquisa,
  };

  bool isOrder = false;

}
