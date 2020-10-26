import 'package:appetit/pages/login/widgets/button_login_widget.dart';
import 'package:appetit/pages/select_product/select_product_page.dart';
import 'package:appetit/shared/widgets/button_border_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) => Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Image.asset(
                    'assets/images/CHEF.png',
                    width: 270,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      'Pedido Realizado!',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                  Spacer(),

                  ButtonLoginWidget(
                    enabled: true,
                    text: 'FAZER UM NOVO PEDIDO',
                    onPressed: () {
                      Get.back();
                      Get.back();
                      Get.back();
                      Get.back(result: true);
                      Get.to(SelectProductPage());
                    },
                  ),
                  ButtonBorderWidget(
                    text: "VOLTAR PARA A PÁGINA INICIAL",
                    colorButton: Colors.white,
                    borderColor: Colors.lightGreen,
                    onPressed: (){
                      Get.back();
                      Get.back();
                      Get.back();
                      Get.back(result: true);

                    },
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
