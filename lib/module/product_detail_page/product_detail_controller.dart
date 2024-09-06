

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/data/home/home_repo.dart';
import 'package:web_mobril_test/data/home/home_repo_impl.dart';
import 'package:web_mobril_test/data/model/getAllProduct_response.dart';
import 'package:web_mobril_test/data/model/get_select_product_response.dart';

class ProductDetailController extends GetxController {
  late HomeRepo _homeRepo;

  ProductDetailController() {
    _homeRepo = Get.find<HomeRepoImpl>() as HomeRepo;
  }


  var isInCart = false.obs;
  var isInWishList = false.obs;


  // Method to add product to cart
  final Products product = Get.arguments;


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
  @override
  void onInit() async{
    super.onInit();
    print("fsfs ${product.id!}");
    final int id =  product.id!;
    getSelectProducts(id);

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
       title.value = response.product!.title!;
       imageUrl.value = response.product!.image!;
       description.value = response.product!.description!;
       price.value = response.product!.price.toString();
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
