import 'dart:async';

import 'package:appetit/shared/models/order.dart';
import 'package:either_option/either_option.dart';

class OrderRepository {
  OrderRepository();

  Future<Either<String, List<Order>>> getOrders() async {
    await Future.delayed(Duration(seconds: 1));

    List<Order> listOrders = [
/*
      Order(
          numeropedido: "1",
          codigocliente: '4',
          data: "22/10/2020",
          nomecliente: "Hanna Montana",
          total: 5.50,
          imagem: "assets/images/CLIENTE4.jpg",
          items: [
            Item(
                codigoproduto: '1',
                imagem: 'assets/images/CUSCUZ.jpg',
                produto: 'Cuscuz simples',
                quantidade: 1,
                valortotal: 2.25,
                valorunitario: 2.25),
            Item(
                codigoproduto: '2',
                imagem: 'assets/images/CUSCUZ.jpg',
                produto: 'Cuscuz completo',
                quantidade: 1,
                valortotal: 3.25,
                valorunitario: 3.25),
          ],

      ),
      Order(
          numeropedido: "2",
          codigocliente: '3',
          data: "22/10/2020",
          nomecliente: "Pablo Alvarez",
          total: 6.50,
          imagem: "assets/images/CLIENTE3.jpg",
          items: [
            Item(
                codigoproduto: '2',
                imagem: 'assets/images/CUSCUZ.jpg',
                produto: 'Cuscuz completo',
                quantidade: 2,
                valortotal: 6.50,
                valorunitario: 3.25),
          ]),
*/
    ];

    try {
      return Right(listOrders);
    } catch (e) {
      return Left('Erro de conexão');
    }
  }
}
