import 'package:appetit/shared/models/customer.dart';
import 'package:either_option/either_option.dart';

class CustomerRepository {
  CustomerRepository();

  Future<Either<String, List<Customer>>> getCustomers() async {
    await Future.delayed(Duration(seconds: 1));

    List<Customer> listCustomers = [
      Customer(codigocliente: '1' , imagem: 'assets/images/CLIENTE1.jpg' , nomecliente: 'Justine Marshall'),
      Customer(codigocliente: '2' , imagem: 'assets/images/CLIENTE2.jpg' , nomecliente: 'Andreia Barros'),
      Customer(codigocliente: '3' , imagem: 'assets/images/CLIENTE3.jpg' , nomecliente: 'Pablo Alvarez'),
      Customer(codigocliente: '4' , imagem: 'assets/images/CLIENTE4.jpg' , nomecliente: 'Hanna Montana'),
      Customer(codigocliente: '5' , imagem: 'assets/images/CLIENTE5.jpg' , nomecliente: 'Justine Marshall'),
      Customer(codigocliente: '6' , imagem: 'assets/images/CLIENTE6.jpg' , nomecliente: 'Bairam Frootan'),
    ];

    try {
      return Right(listCustomers);
    } catch (e) {
      return Left('Erro de conexão');
    }
  }

}