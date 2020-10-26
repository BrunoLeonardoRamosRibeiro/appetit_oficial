import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {

  RxBool isLoading = RxBool(true);

  void setLoading(bool value) => isLoading.value = value;

  RxInt customerPaid = RxInt(null);

  setCustomerPaid(int value) {
    customerPaid.value = value;
    setButtonEnabled();
  }

  RxString payDay = RxString("Selecione uma data");

  setPayDay(String value) {
    payDay.value = value;
    setButtonEnabled();
  }

  RxBool buttonEnabled = RxBool(false);

  setButtonEnabled() {
    if (payDay.value != "Selecione uma data" && customerPaid.value != null) {
      buttonEnabled.value = true;
    } else {
      buttonEnabled.value = false;
    }
  }
}
