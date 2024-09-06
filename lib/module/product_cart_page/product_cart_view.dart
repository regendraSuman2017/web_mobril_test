import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_mobril_test/CustomAppbar.dart';
import 'package:web_mobril_test/module/product_cart_page/product_cart_controller.dart';
import 'package:web_mobril_test/responsive.dart';

class CartScreen extends GetView<ProductCartController> {
  const CartScreen({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return const CustomAppBar(
      title: "My cart list",
    );
  }


  @override
  Widget build(BuildContext context) {
    //controller.getCartItems();
    Get.find<ProductCartController>();
    var size = MediaQuery.of(context).size;
    double widthSize = Get.width;
    return Scaffold(
      appBar: _appBar(context),
      body: Obx(()=>SizedBox(
        height: 500,
        child: controller.productList.isEmpty
            ? const Center(
          child: Text("Empty"),
        ) : ListView.builder(
            itemCount: controller.productList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.only(top:
                ResponsiveLayout.isSmallScreen(context)
                    ? widthSize * 0.035
                    : ResponsiveLayout.isMediumScreen(context)
                    ? widthSize * 0.035
                    : widthSize * 0.017
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        controller.productList[index].image!,
                        width: size.width / 4,
                        height: size.width / 4,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                        controller.productList[index].title!,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: ResponsiveLayout.isSmallScreen(context)
                                    ? widthSize * 0.042
                                    : ResponsiveLayout.isMediumScreen(context)
                                    ? widthSize * 0.03
                                    : widthSize * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: ResponsiveLayout.isSmallScreen(context)
                                  ? widthSize * 0.02
                                  : ResponsiveLayout.isMediumScreen(context)
                                  ? widthSize * 0.02
                                  : widthSize * 0.01,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$${controller.productList[index].price.toString()}', style: TextStyle(
                                  fontSize: ResponsiveLayout.isSmallScreen(context)
                                      ? widthSize * 0.038
                                      : ResponsiveLayout.isMediumScreen(context)
                                      ? widthSize * 0.027
                                      : widthSize * 0.015,
                                )),
                                 IconButton(
                                  onPressed: (){
                                    controller.deleteItem(int.parse(controller.productList[index].productId!));
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                  ),
                                   color: Colors.red,

                                )
                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );

            }),
      )),
      bottomNavigationBar: Obx(()=>Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total price :",style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w700,
            fontSize: Get.width*0.05,
          ),),
          Text("\$${controller.totalPriceNew.value}",style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w700,
            fontSize: Get.width*0.05,
          )),
        ],
      ).paddingSymmetric(horizontal: 12,vertical: 8),
      )
    );
  }
}