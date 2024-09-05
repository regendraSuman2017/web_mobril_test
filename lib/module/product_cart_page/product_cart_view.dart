
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/module/product_cart_page/product_cart_controller.dart';

class CartScreen extends GetView<ProductCartController> {
  const CartScreen({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "My cart",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    //controller.getCartItems();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(context),
      body: Obx(()=>SizedBox(
        child: ListView.builder(
            itemCount: controller.items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding:
                EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFFFFFF),
                          const Color(0xB0E7E9E7),
                        ],
                        begin: Alignment(0.2, 0.0),
                        end: Alignment(1.0, 0.0),
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Image.network(
                      controller.items[index].image!,
                      width: size.width / 4,
                      height: size.width / 4,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.items[index].title.toString()),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.items[index].price.toString() +
                                    " \$",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color(0xff465bd8),
                                    fontWeight: FontWeight.bold),
                              ),
                              FloatingActionButton(
                                backgroundColor: Color(0xff465bd8),
                                onPressed: () {
                                  //controller.deleteItem(controller.items[index]);
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 20,
                                ),
                                mini: true,
                                materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                                heroTag: null,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      )),

    );
  }
}