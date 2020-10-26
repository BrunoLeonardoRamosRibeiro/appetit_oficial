import 'package:appetit/pages/detail_order/controller/detail_order_controller.dart';
import 'package:appetit/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionsWidget extends StatelessWidget {
  DetailOrderController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.product.opcoes.length > 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Opções',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Escolha uma das opções de massas disponíveis abaixo.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17, color: Colors.blueGrey),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: controller.product.opcoes.length,
              itemBuilder: (_, index) {
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.setSelectOption(index);
                      controller.setValuesBarVisible(true);
                    },
                    child: Card(
                      child: ListTile(
                        leading: controller.selectedOptionIndex.value == index
                            ? Icon(Icons.radio_button_checked,
                                color: ORANGE_APPETIT)
                            : Icon(Icons.radio_button_off,
                                color: ORANGE_APPETIT),
                        title: Text(controller.product.opcoes[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
