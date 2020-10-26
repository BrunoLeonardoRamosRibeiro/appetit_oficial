import 'package:appetit/pages/checkout/checkout_page.dart';
import 'package:appetit/pages/login/widgets/search_widget.dart';
import 'package:appetit/pages/select_customer/controller/select_customer_controller.dart';
import 'package:appetit/shared/constants.dart';
import 'package:appetit/shared/models/order.dart';
import 'package:appetit/shared/widgets/header_widget.dart';
import 'package:appetit/shared/widgets/picture_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class SelectClientPage extends StatefulWidget {
  @override
  _SelectClientPageState createState() => _SelectClientPageState();
}

class _SelectClientPageState extends State<SelectClientPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectCustomerController>(
      init: SelectCustomerController(),
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // nada ainda
          },
          tooltip: 'Increment',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: Obx(
          () => Visibility(
            visible: controller.totalSelected.value != 0,
            child: Material(
              elevation: 14,
              child: Container(
                height: 80,
                width: double.maxFinite,
                color: ORANGE_APPETIT,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '${controller.totalSelected.value} clientes selecionados',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(CheckoutPage());
                        },
                        child: Row(
                          children: [
                            Text(
                              'Avançar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 260,
                child: Column(
                  children: [
                    SafeArea(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: ORANGE_APPETIT,
                            ),
                            onPressed: Get.back,
                          ),
                        ),
                      ),
                    ),
                    HeaderWidget(
                        text: 'Informações para o pedido', fontSize: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Preencha as informações abaixo para concluir o pedido.',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17, color: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Para quem você está vendendo?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                              Text(
                                '2 de 3',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 17),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: RoundedProgressBar(
                              height: 10,
                              style: RoundedProgressBarStyle(
                                  colorProgress: ORANGE_APPETIT,
                                  backgroundProgress:
                                      Colors.grey.withOpacity(0.1),
                                  borderWidth: 0,
                                  widthShadow: 0),
                              borderRadius: BorderRadius.circular(24),
                              percent: 66,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SearchWidget(
                label: "Digite a sua busca aqui",
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: ORANGE_APPETIT,
                  size: 30,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    'Meus Clientes',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: !controller.isLoading.value,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: controller.customers.length,
                    itemBuilder: (_, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                        child: GestureDetector(
                          onTap: (){

                            setState(() {
                              controller.customers[index].isOrder = !controller.customers[index].isOrder;
                              controller.setTotalSelected();
                              controller.setSelectedCustomers(controller.customers[index]);
                              print('Quantidade de Customers Selecionados ==> ${controller.selectedCustomers.length}');
                            });

                          },

                          child: Card(
                            color: controller.customers[index].isOrder
                                ? ORANGE_APPETIT
                                : Colors.white,
                            child: Container(
                              height: 90,
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child: PictureWidget(
                                      imagePath:
                                      controller.customers[index].imagem,
                                      size: 70,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.customers[index].nomecliente,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                          !controller.customers[index].isOrder
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
