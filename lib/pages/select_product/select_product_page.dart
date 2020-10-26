import 'package:appetit/pages/detail_order/detail_order_page.dart';
import 'package:appetit/pages/login/widgets/search_widget.dart';
import 'package:appetit/pages/select_customer/select_customer_page.dart';
import 'package:appetit/pages/select_product/controller/select_product_controller.dart';
import 'package:appetit/shared/constants.dart';
import 'package:appetit/shared/models/product.dart';
import 'package:appetit/shared/widgets/header_widget.dart';
import 'package:appetit/shared/widgets/picture_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:get/get.dart';

class SelectProductPage extends StatefulWidget {
  @override
  _SelectProductPageState createState() => _SelectProductPageState();
}

class _SelectProductPageState extends State<SelectProductPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectProductController>(
      init: SelectProductController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: Obx(
          () => Visibility(
            visible: controller.totalValueOrder.value != 0,
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
                        'Total: R\$ ${controller.totalValueOrder.value.toStringAsFixed(2)}',
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
                          Get.to(SelectClientPage());
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
                height: 255,
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
                            onPressed: ()=> Get.back(result: false),
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
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'O que você está vendendo?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                              Text(
                                '1 de 3',
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
                                  backgroundProgress: Colors.grey.withOpacity(0.1),
                                  borderWidth: 0,
                                  widthShadow: 0),
                              borderRadius: BorderRadius.circular(24),
                              percent: 33,
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
              Obx(
                () => Visibility(
                  replacement: Center(
                    child: CircularProgressIndicator(),
                  ),
                  visible: !controller.isLoading.value,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: controller.categories.length,
                    itemBuilder: (_, index) {
                      List<Product> lista = controller.products
                          .where((listProduct) => listProduct.categoria
                              .contains(controller.categories[index].categoria))
                          .toList();

                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              controller.categories[index].categoria,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: lista.length,
                            itemBuilder: (__, indexProduct) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(DetailOrderPage(),
                                          arguments: lista[indexProduct])
                                      .then((value) {
                                    if (value) {
                                      print(
                                          'Total de Itens adicionados ==> ${controller.itemsOrder.length}');

                                      print(
                                          'Valor Total ==> ${controller.totalValueOrder}');

                                      controller.addItemListOrder(
                                          lista[indexProduct].codigoproduto);

                                      setState(() {
                                        lista[indexProduct].isOrder = true;
                                      });
                                    }
                                  });
                                },
                                child: Card(
                                  color: lista[indexProduct].isOrder
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
                                                lista[indexProduct].imagem,
                                            size: 70,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              lista[indexProduct].produto,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    !lista[indexProduct].isOrder
                                                        ? Colors.black
                                                        : Colors.white,
                                              ),
                                            ),
                                            Visibility(
                                              visible: lista[indexProduct]
                                                  .descricao
                                                  .isNotEmpty,
                                              child: Text(
                                                lista[indexProduct].descricao,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: !lista[indexProduct]
                                                          .isOrder
                                                      ? Colors.grey
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            width: 80,
                                            child: Center(
                                              child: Text(
                                                'R\$ ${lista[indexProduct].preco.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: !lista[indexProduct].isOrder? Colors.black : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Divider(),
                        ],
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
