import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString labelEmail = RxString("");

  setLabelEmail(String value) {
    labelEmail.value = value;
    setButtonEnabled();
  }

  RxString labelPassword = RxString("");

  setLabelPassword(String value) {
    labelPassword.value = value;
    setButtonEnabled();
  }

  RxBool showPassword = RxBool(false);

  setShowPassword(bool value) => showPassword.value = value;

  RxBool buttonEnabled = RxBool(false);

  setButtonEnabled() {
    if (labelEmail.value == "login@email.com" &&
        labelPassword.value == "123456") {
      buttonEnabled.value = true;
    } else {
      buttonEnabled.value = false;
    }
  }
}
