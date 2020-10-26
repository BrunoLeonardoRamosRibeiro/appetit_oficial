// To parse this JSON data, do
//
//     final client = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    this.codigocliente,
    this.nomecliente,
    this.imagem,
  });

  String codigocliente;
  String nomecliente;
  String imagem;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    codigocliente: json["codigocliente"],
    nomecliente: json["nomecliente"],
    imagem: json["imagem"],
  );

  Map<String, dynamic> toJson() => {
    "codigocliente": codigocliente,
    "nomecliente": nomecliente,
    "imagem": imagem,
  };

  bool isOrder = false;
}
