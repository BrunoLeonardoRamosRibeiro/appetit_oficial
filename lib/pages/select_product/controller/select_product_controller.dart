import 'package:appetit/shared/models/category.dart';
import 'package:appetit/shared/models/order.dart';
import 'package:appetit/shared/models/product.dart';
import 'package:appetit/shared/repositories/category_repository.dart';
import 'package:appetit/shared/repositories/product_repository.dart';
import 'package:either_option/either_option.dart';
import 'package:get/get.dart';

class SelectProductController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  CategoryRepository categoryRepository = CategoryRepository();

  RxList<String> listOrder = RxList<String>();
  clearListOrder()=> listOrder.clear();
  addItemListOrder(String item) => listOrder.add(item);

  RxList<Product> products = RxList<Product>();
  setProducts(List<Product> listProduct) => products.value = listProduct;

  RxBool isLoading = RxBool(true);

  void setLoading(bool value) => isLoading.value = value;

  RxList<Category> categories = RxList<Category>();

  setCategories(List<Category> listCategories) =>
      categories.value = listCategories;

  fetchProducts() async {
    Either<String, List<Product>> resProducts =
        await productRepository.getProducts();
    resProducts.fold(
        (msg) => print(msg), (listProduct) => setProducts(listProduct));
  }

  fetchCategories() async {
    Either<String, List<Category>> resCategories =
        await categoryRepository.getCategories();
    resCategories.fold(
        (msg) => print(msg), (listCategories) => setCategories(listCategories));
  }

  RxList<Item> itemsOrder = RxList<Item>();
  clearItemsOrder() {
    itemsOrder.clear();
    setTotalValueOrder();
  }

  setNewItem(Item newItem) {

    var contain = itemsOrder.where((element) => element.codigoproduto == newItem.codigoproduto);

    if (contain.isEmpty) {
      itemsOrder.add(newItem);
    } else {
      itemsOrder.removeWhere((it) => it.codigoproduto == newItem.codigoproduto);
      itemsOrder.add(newItem);
    }

    setTotalValueOrder();
  }

  RxDouble totalValueOrder = RxDouble(0.00);
  setTotalValueOrder() {
    var total = 0.00;
    if (itemsOrder.length > 0) {
      itemsOrder.forEach((itens) {
        total = total + (itens.quantidade * itens.valorunitario);
      });
    }
    totalValueOrder.value = total;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    setLoading(true);
    fetchCategories();
    fetchProducts();
    clearItemsOrder();
    setLoading(false);
  }
}
