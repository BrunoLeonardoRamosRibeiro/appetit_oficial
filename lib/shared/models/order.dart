// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.numeropedido,
    this.codigocliente,
    this.nomecliente,
    this.data,
    this.total,
    this.items,
    this.imagem,
  });

  String numeropedido;
  String codigocliente;
  String nomecliente;
  String data;
  double total;
  List<Item> items;
  String imagem;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    numeropedido: json["numeropedido"],
    codigocliente: json["codigocliente"],
    nomecliente: json["nomecliente"],
    data: json["data"],
    total: json["total"].toDouble(),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    imagem: json["imagem"],
  );

  Map<String, dynamic> toJson() => {
    "numeropedido": numeropedido,
    "codigocliente": codigocliente,
    "nomecliente": nomecliente,
    "data": data,
    "total": total,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "imagem": imagem,
  };


  String resumo = "";
}

class Item {
  Item({
    this.codigoproduto,
    this.produto,
    this.quantidade,
    this.valorunitario,
    this.valortotal,
    this.imagem,
  });

  String codigoproduto;
  String produto;
  int quantidade;
  double valorunitario;
  double valortotal;
  String imagem;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    codigoproduto: json["codigoproduto"],
    produto: json["produto"],
    quantidade: json["quantidade"],
    valorunitario: json["valorunitario"].toDouble(),
    valortotal: json["valortotal"].toDouble(),
    imagem: json["imagem"],
  );

  Map<String, dynamic> toJson() => {
    "codigoproduto": codigoproduto,
    "produto": produto,
    "quantidade": quantidade,
    "valorunitario": valorunitario,
    "valortotal": valortotal,
    "imagem": imagem,
  };
}
