import 'package:appetit/shared/models/category.dart';
import 'package:either_option/either_option.dart';

class CategoryRepository {
  CategoryRepository();

  Future<Either<String, List<Category>>> getCategories() async {
    await Future.delayed(Duration(seconds: 1));

    List<Category> listCategories = [
      Category(categoria: "Cuscuz"),
      Category(categoria: "Pães"),
    ];

    try {
      return Right(listCategories);
    } catch (e) {
      return Left('Erro de conexão');
    }
  }
}
