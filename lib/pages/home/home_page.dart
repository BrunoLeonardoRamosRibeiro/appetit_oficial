import 'package:appetit/pages/home/controller/home_page_controller.dart';
import 'package:appetit/pages/login/widgets/search_widget.dart';
import 'package:appetit/pages/select_product/select_product_page.dart';
import 'package:appetit/shared/constants.dart';
import 'package:appetit/shared/models/order.dart';
import 'package:appetit/shared/widgets/header_widget.dart';
import 'package:appetit/shared/widgets/picture_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var res = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      id: 'home',
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      print('quantidade de Pedidos/Orders => ${controller.orders.length}');
                    },
                    child: PictureWidget(
                      imagePath: 'assets/images/ALESSANDRA.jpg',
                      size: 60,
                    ),
                  ),
                ),
                HeaderWidget(text: 'Olá, Alessandra!', fontSize: 24),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MaterialButton(
                    height: 60,
                    elevation: 10,
                    onPressed: () {
                      Get.to(SelectProductPage()).then((value){
                        print('resultado final ===> $value');
                        controller.dates.clear();
                        controller.fetchOrders();
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 30,
                          color: ORANGE_APPETIT,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'FAZER NOVO PEDIDO',
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 16),
                        ),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
                SearchWidget(
                  label: "Digite sua busca aqui",
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: ORANGE_APPETIT,
                    size: 30,
                  ),
                  sufixIcon: Icon(
                    Icons.tune_outlined,
                    color: ORANGE_APPETIT,
                    size: 30,
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: !controller.isLoading.value,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: controller.dates.length,
                      itemBuilder: (_, index) {
                        List<Order> lista = controller.orders.where((order) => order.data.contains(controller.dates[index]) ).toList();
                        
                        double total = 0.00;
                        
                        lista.forEach((e) {
                          total = total + e.total;                          
                        });



                        return Column(
                          children: [
                            ListTile(
                                title: Text(
                              controller.dates[index] + ', você já vendeu R\$ ${total.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16),
                            )),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: lista.length,
                              itemBuilder: (__, index) {



                                //setState(() {
                                  res = "";

                                  lista[index].items.forEach((element) {

                                    res = res + element.produto+',';

                                  });
                                  res = res.substring(0, res.length - 1)+'.';
                                  lista[index].resumo = res;


                                //});

                                return Card(
                                  child: Container(
                                    height: 90,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          child: PictureWidget(
                                            imagePath:
                                            lista[index].imagem,
                                            size: 70,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                lista[index].nomecliente,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible: lista[index]
                                                  .resumo
                                                  .isNotEmpty,
                                              child: Container(
                                                width: 180,
                                                child: Text(
                                                  lista[index].resumo,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14,

                                                  ),
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
                                                'R\$ ${lista[index].total.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
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
      ),
    );
  }
}
