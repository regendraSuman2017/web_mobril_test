

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/data/home/home_repo.dart';
import 'package:web_mobril_test/data/home/home_repo_impl.dart';
import 'package:web_mobril_test/data/model/getAllProduct_response.dart';
import 'package:web_mobril_test/data/model/get_select_product_response.dart';
import 'package:web_mobril_test/module/product_cart_page/product_cart_controller.dart';

class ProductDetailController extends GetxController {
  late HomeRepo _homeRepo;


  ProductDetailController() {
    _homeRepo = Get.find<HomeRepoImpl>() as HomeRepo;
  }


  var isInCart = false.obs;
  var isInWishList = false.obs;
  RxInt totalPrice = 0.obs;


  // Method to add product to cart




  void addToWishList() {
    isInWishList.value = true;
  }





  TextEditingController searchText = TextEditingController();

  RxBool isLoading = false.obs;

  RxString id=''.obs;
  RxString title=''.obs;
  RxString imageUrl=''.obs;
  RxString description=''.obs;
  RxString price=''.obs;

  final GetAllProductResponse product = Get.arguments;

  @override
  void onInit() async{
    super.onInit();
    print("daskldjlak ${product.id}");
    getSelectProducts(product.id!);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getSelectProducts(int id) async {
    isLoading.value = true;
    try {
      final response = await _homeRepo.getSelectProductsAPI(id);
      if (response != null) {



       title.value = response.title!;
       imageUrl.value = response.image!;
       description.value = response.description!;
       price.value = response.price.toString();

      } else {
      }
    } catch (e) {

      Get.snackbar(
        "Failed",
        "Failed to fetch products",
        icon: const Icon(Icons.clear, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0x00ffef53),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } finally {
      isLoading.value = false;
    }
  }



}
