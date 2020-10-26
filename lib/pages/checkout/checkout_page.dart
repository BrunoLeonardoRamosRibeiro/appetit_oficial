import 'package:appetit/pages/checkout/controller/checkout_controller.dart';
import 'package:appetit/pages/finish/finish_page.dart';
import 'package:appetit/pages/home/controller/home_page_controller.dart';
import 'package:appetit/pages/login/widgets/button_login_widget.dart';
import 'package:appetit/pages/select_customer/controller/select_customer_controller.dart';
import 'package:appetit/pages/select_product/controller/select_product_controller.dart';
import 'package:appetit/shared/constants.dart';
import 'package:appetit/shared/models/order.dart';
import 'package:appetit/shared/widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  HomePageController homePageController = Get.find();
  SelectCustomerController selectCustomerController = Get.find();
  SelectProductController selectProductController = Get.find();

  CalendarController _controller;

  FocusNode myFocus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocus = FocusNode();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    _controller.dispose();
    myFocus.dispose();
    super.dispose();
  }

  void requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      init: CheckoutController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: Obx(
          () => ButtonLoginWidget(
            enabled: controller.buttonEnabled.value,
            text: 'FINALIZAR',
            onPressed: () {

              selectCustomerController.selectedCustomers.forEach((customers) {

                var valueTotal = 0.00;
                List<Item> itemsOrd = selectProductController.itemsOrder;
                selectProductController.itemsOrder.forEach((it) {

                  valueTotal = valueTotal + (it.valorunitario * it.quantidade);

                });

                homePageController.addNewOrder(


                  Order(
                      numeropedido: customers.codigocliente,
                      codigocliente: customers.codigocliente,
                      data: controller.payDay.value,
                      nomecliente: customers.nomecliente,
                      total: valueTotal,
                      imagem: customers.imagem,
                      items: itemsOrd),
                );



              });

              /*homePageController.addNewOrder(
                Order(
                    numeropedido: "2",
                    codigocliente: '3',
                    data: "26/10/2020",
                    nomecliente: "Pablo Alvarez",
                    total: 6.50,
                    imagem: "assets/images/CLIENTE3.jpg",
                    items: [
                      Item(
                          codigoproduto: '2',
                          imagem: 'assets/images/CUSCUZ.jpg',
                          produto: 'Cuscuz completo',
                          quantidade: 2,
                          valortotal: 6.50,
                          valorunitario: 3.25),
                    ]),
              );*/
              Get.to(FinishPage());
            },
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
                                'Finalizar Pedido',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                              Text(
                                '3 de 3',
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
                              percent: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    'O cliente já pagou?',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      controller.setCustomerPaid(1);
                    },
                    child: Card(
                      child: ListTile(
                        leading: controller.customerPaid.value == 1
                            ? Icon(Icons.radio_button_checked,
                                color: ORANGE_APPETIT)
                            : Icon(Icons.radio_button_off,
                                color: ORANGE_APPETIT),
                        title: Text('Sim'),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      controller.setCustomerPaid(0);
                    },
                    child: Card(
                      child: ListTile(
                        leading: controller.customerPaid.value == 0
                            ? Icon(Icons.radio_button_checked,
                                color: ORANGE_APPETIT)
                            : Icon(Icons.radio_button_off,
                                color: ORANGE_APPETIT),
                        title: Text('Não'),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    'Em que data o pedido foi realizado?',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Obx(
                  ()=> GestureDetector(
                    onTap: () async{
                      final data = await showDatePicker(
                        context: Get.context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2018),
                        lastDate: DateTime(2021),
                        locale: Locale('pt', 'BR'),
                        confirmText: 'CONFIRMAR',
                      );

                      if (data != null) {
                        controller.setPayDay(DateFormat('dd/MM/yyyy').format(data));
                      }

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      height: 60,
                      width: double.maxFinite,
                      child: ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text(
                          controller.payDay.value,
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ORANGE_APPETIT,
                        ),
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
  }
}

