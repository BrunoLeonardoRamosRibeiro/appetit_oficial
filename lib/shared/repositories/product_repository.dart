import 'package:appetit/shared/models/product.dart';
import 'package:either_option/either_option.dart';

class ProductRepository {
  ProductRepository();

  Future<Either<String, List<Product>>> getProducts() async {
    await Future.delayed(Duration(seconds: 1));

    List<Product> listProducts = [
      Product(
        categoria: "Cuscuz",
        descricao: "milho ou arroz",
        produto: "Cuscuz simples",
        codigoproduto: "1",
        imagem: "assets/images/CUSCUZ.jpg",
        preco: 2.25,
        opcoes: ["Cuscuz de milho", "Cuscuz de arroz"],
      ),
      Product(
        categoria: "Cuscuz",
        descricao: "milho ou arroz",
        produto: "Cuscuz completo",
        codigoproduto: "2",
        imagem: "assets/images/CUSCUZ.jpg",
        preco: 3.25,
        opcoes: ["Cuscuz de milho", "Cuscuz de arroz"],
      ),
      Product(
        categoria: "Pães",
        descricao: "",
        produto: "Pão caseiro",
        codigoproduto: "3",
        imagem: "assets/images/PAES.jpg",
        preco: 2.25,
        opcoes: [],
      ),
      Product(
        categoria: "Pães",
        descricao: "",
        produto: "Pão caseiro completo",
        codigoproduto: "4",
        imagem: "assets/images/PAES.jpg",
        preco: 3.25,
        opcoes: [],
      ),
      Product(
        categoria: "Pães",
        descricao: "",
        produto: "Misto quente",
        codigoproduto: "5",
        imagem: "assets/images/PAES.jpg",
        preco: 3.00,
        opcoes: [],
      ),
      Product(
        categoria: "Pães",
        descricao: "",
        produto: "Língua de sogra (pq.)",
        codigoproduto: "6",
        imagem: "assets/images/PAES.jpg",
        preco: 2.00,
        opcoes: [],
      ),
      Product(
        categoria: "Pães",
        descricao: "",
        produto: "Língua de sogra (gr.)",
        codigoproduto: "7",
        imagem: "assets/images/PAES.jpg",
        preco: 3.00,
        opcoes: [],
      ),
    ];

    try {
      return Right(listProducts);
    } catch (e) {
      return Left('Erro de conexão');
    }
  }
}
