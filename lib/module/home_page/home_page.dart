
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_mobril_test/core/icons.dart';
import 'package:web_mobril_test/data/model/getAllProduct_response.dart';
import 'package:web_mobril_test/responsive.dart';
import 'package:web_mobril_test/routes/app_pages.dart';
import 'home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double widthSize = Get.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Product List"),
          actions: [
            InkWell(
                onTap: ()async{
                  Get.toNamed(Routes.cartScreen);
                },
                child: const Icon(Icons.power_settings_new_outlined)),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  // Navigate to home screen or perform action
                  Navigator.pop(context); // Closes the drawer
                },
              ),
             Obx(()=> ListTile(
                leading: const Icon(Icons.brightness_6), // Icon for theme toggle
                title: const Text('Change Theme'),
                trailing:   Switch(
                  value: controller.isSwitched.value ,
                  onChanged: (value) {
                    // Update the state of switch
                    controller.isSwitched.value  = value;
                    (value==true)? Get.changeTheme(ThemeData.dark()): Get.changeTheme(ThemeData.light());
                  },
                ),
             )
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            /*TextField(
              onChanged: (p0) {
                controller.filterProductList(p0);
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.all(
                    ResponsiveLayout.isSmallScreen(context)
                        ? widthSize*0.035
                        : ResponsiveLayout.isMediumScreen(context)
                        ? widthSize*0.035
                        : widthSize*0.017),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText:'Search here..',
                labelStyle:  TextStyle(
                  fontSize: ResponsiveLayout.isSmallScreen(context)
                      ? widthSize*0.04
                      : ResponsiveLayout.isMediumScreen(context)
                      ? widthSize*0.025
                      : widthSize*0.017,
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                prefixIcon: AppIcons.searchIcon
              ),
            ).marginOnly(top: 10),*/

         Obx(()=>SizedBox(
              height: Get.height*0.8,
              child:controller.isLoading.value==true
                  ? Center(child: CircularProgressIndicator(),)
                  :
           ListView.builder(
                itemCount: controller.getProductList.length,
                itemBuilder: (context, index) {
                  GetAllProductResponse product = controller.getProductList[index];
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Get.toNamed(Routes.productDetailScreen,arguments: product,);
                    },
                    child: Card(
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
                              product.image!,
                              width: ResponsiveLayout.isSmallScreen(context)
                                  ? widthSize * 0.17
                                  : ResponsiveLayout.isMediumScreen(context)
                                  ? widthSize * 0.15
                                  : widthSize * 0.08,
                              height: ResponsiveLayout.isSmallScreen(context)
                                  ? widthSize * 0.17
                                  : ResponsiveLayout.isMediumScreen(context)
                                  ? widthSize * 0.15
                                  : widthSize * 0.08,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title!,
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
                                  Text('\$${product.price}', style: TextStyle(
                                    fontSize: ResponsiveLayout.isSmallScreen(context)
                                        ? widthSize * 0.038
                                        : ResponsiveLayout.isMediumScreen(context)
                                        ? widthSize * 0.027
                                        : widthSize * 0.015,
                                  )),
                                  SizedBox(
                                    height: ResponsiveLayout.isSmallScreen(context)
                                        ? widthSize * 0.01
                                        : ResponsiveLayout.isMediumScreen(context)
                                        ? widthSize * 0.01
                                        : widthSize * 0.001,
                                  ),
                                  Text(
                                    'Rating: ${product.rating!.rate} (${product.rating!.count} reviews)',
                                    style: TextStyle(
                                      fontSize: ResponsiveLayout.isSmallScreen(context)
                                          ? widthSize * 0.038
                                          : ResponsiveLayout.isMediumScreen(context)
                                          ? widthSize * 0.027
                                          : widthSize * 0.015,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
         )
         )
          ],
        ).paddingSymmetric(horizontal:  ResponsiveLayout.isSmallScreen(context)
            ? widthSize*0.035
            : ResponsiveLayout.isMediumScreen(context)
            ? widthSize*0.035
            : widthSize*0.017),
      ),
    );
  }
}
