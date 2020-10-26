import 'package:appetit/pages/detail_order/controller/detail_order_controller.dart';
import 'package:appetit/pages/detail_order/widgets/options_widget.dart';
import 'package:appetit/pages/select_product/controller/select_product_controller.dart';
import 'package:appetit/shared/constants.dart';
import 'package:appetit/shared/models/order.dart';
import 'package:appetit/shared/widgets/decoration_shadow_widget.dart';
import 'package:appetit/shared/widgets/header_widget.dart';
import 'package:appetit/shared/widgets/picture_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOrderPage extends StatefulWidget {
  @override
  _DetailOrderPageState createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  //HomePageController homeController = Get.find();
  SelectProductController selectProductController = Get.find();

  FocusNode myFocus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocus = FocusNode();
  }

  void requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailOrderController>(
      init: DetailOrderController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: Obx(
          () => Visibility(
            visible: controller.navValuesBarVisible.value,
            child: Material(
              elevation: 14,
              child: Container(
                height: 90,
                width: double.maxFinite,
                color: Colors.white,
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 0, right: 16),
                      height: 70,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: ORANGE_APPETIT,
                                  size: 30,
                                ),
                                onPressed: () => controller.decQuantity()),
                          ),
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.quantity.value.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: ORANGE_APPETIT,
                                  size: 30,
                                ),
                                onPressed: () => controller.incQuantity()),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        selectProductController.setNewItem(
                          Item(
                              codigoproduto: controller.product.codigoproduto,
                              imagem: controller.product.imagem,
                              produto: controller.product.produto,
                              quantidade: controller.quantity.value,
                              valortotal: (controller.quantity.value *
                                  controller.product.preco),
                              valorunitario: controller.product.preco),
                        );
                        //selectProductController.setTotalValueOrder();
                        Get.back(result: true);
                      },
                      child: Container(
                        margin: EdgeInsets.all(16),
                        height: 70,
                        width: 178,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Adicionar',
                                style: TextStyle(color: Colors.white)),
                            Obx(() => Text(
                                'R\$ ${controller.totalValue.toStringAsFixed(2)}',
                                style: TextStyle(color: Colors.white))),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ORANGE_APPETIT,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      onPressed: () => Get.back(result: false),
                    ),
                  ),
                ),
              ),
              HeaderWidget(text: 'Detalhes do pedido', fontSize: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Caso queira, aproveite para adicionar alguma observação para este pedido.',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 17, color: Colors.blueGrey),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              DecorationShadowWidget(
                height: 80,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: PictureWidget(
                        imagePath: controller.product.imagem,
                        size: 70,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.product.produto,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Visibility(
                          visible: controller.product.descricao.isNotEmpty,
                          child: Text(
                            controller.product.descricao,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
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
                            'R\$ ${controller.product.preco.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              OptionsWidget(),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Observações',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    onTap: requestFocus,
                    focusNode: myFocus,
                    //keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: myFocus.hasFocus
                          ? null
                          : "Deseja adicionar alguma obs.?",
                      labelStyle: TextStyle(
                          color:
                              myFocus.hasFocus ? ORANGE_APPETIT : Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: ORANGE_APPETIT,
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      controller.setObs(text);
                      controller.setValuesBarVisible(false);
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
