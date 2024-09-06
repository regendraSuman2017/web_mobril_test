import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/data/model/getAllProduct_response.dart';
import 'package:web_mobril_test/service/api_service.dart';
import 'package:web_mobril_test/theme/app_colors.dart';

class HomePageController extends GetxController {

  HomePageController() {
  }

  RxList<Products> getAllProductList = <Products>[].obs;
  RxList<Products> getProductFilterList = <Products>[].obs;

  TextEditingController searchText = TextEditingController();

  //RxList<GetAllProductResponse> categories = <GetAllProductResponse>[].obs;

  RxBool isLoading = false.obs;
  RxBool isSwitched = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllProducts();

  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String?> categoriesList = <String>[];

  Future<void> getAllProducts() async {
    isLoading.value = true;
    try {
      final response = await ApiService().getAllProductsRequest();
      isLoading.value = false;
      if (response!= null) {
        getAllProductList.value = response.products!;
        getProductFilterList.value = response.products!;

        // Extract unique categories from the response

        categoriesList = getAllProductList.map((product) => product.category)  // Extract the category from each product
            .where((category) => category != null) // Remove null categories
            .toSet() // Remove duplicate categories
            .toList(); // Convert the Set back to a List
        categoriesList.insert(0, "All");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Failed",
        "Failed to fetch products",
        icon: const Icon(Icons.clear, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0x00ffef53),
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


void filterProductList(String query) {
  if (query.isEmpty) {
    getProductFilterList.assignAll(getAllProductList);
  } else {
    getProductFilterList.assignAll(getAllProductList.where((product) => product.title!.toLowerCase().contains(query.toLowerCase())).toList(),
    );
  }
}
  void filterItemsByCategory(String index) {
    isLoading.value = true;  // Set loading to true

    // Clear the filter list only if you are applying a new filter
    if (index == 'All') {
      getAllProducts();
    } else {
     getCategoryWise(index);
    }

    isLoading.value = false;  // Set loading to false
    update();  // Trigger UI update
  }

  void getCategoryWise(String query)async {
    isLoading.value = true;
    try {
      final response = await ApiService().getCategoryWiseRequest(query);
      isLoading.value = false;
      if (response != null) {
        getAllProductList.value = response.products!;
        getProductFilterList.value = response.products!;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Failed",
        "Failed to fetch products",
        icon: const Icon(Icons.clear, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primaryColor,
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
