import 'package:appetit/shared/models/customer.dart';
import 'package:appetit/shared/repositories/customer_repository.dart';
import 'package:either_option/either_option.dart';
import 'package:get/get.dart';

class SelectCustomerController extends GetxController {
  CustomerRepository customerRepository = CustomerRepository();

  RxBool isLoading = RxBool(true);

  void setLoading(bool value) => isLoading.value = value;

  RxList<Customer> customers = RxList<Customer>();

  setCustomers(List<Customer> list) => customers.value = list;

  RxInt totalSelected = RxInt(0);

  setTotalSelected() {
    var total = 0;
    customers.forEach((list) {
      if (list.isOrder) {
        total++;
      }
    });
    totalSelected.value = total;
  }

  RxList<Customer> selectedCustomers = RxList<Customer>();
  setSelectedCustomers(Customer customer) {
    var contain = selectedCustomers
        .where((element) => element.codigocliente == customer.codigocliente);
    if (contain.isEmpty) {
      selectedCustomers.add(customer);
    } else {
      selectedCustomers
          .removeWhere((it) => it.codigocliente == customer.codigocliente);
      selectedCustomers.add(customer);
    }
  }

  fetchCustomers() async {
    Either<String, List<Customer>> resCustomers =
        await customerRepository.getCustomers();
    resCustomers.fold((msg) => print(msg), (list) => setCustomers(list));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setLoading(true);
    fetchCustomers();
    setLoading(false);
  }
}
