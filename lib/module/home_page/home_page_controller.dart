import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/data/home/home_repo.dart';
import 'package:web_mobril_test/data/home/home_repo_impl.dart';
import 'package:web_mobril_test/data/model/getAllProduct_response.dart';

class HomePageController extends GetxController {
  late HomeRepo _homeRepo;

  HomePageController() {
    _homeRepo = Get.find<HomeRepoImpl>();
  }

  RxList<GetAllProductResponse> getProductList = <GetAllProductResponse>[].obs;
  RxList<GetAllProductResponse> getProductFilterList = <GetAllProductResponse>[].obs;

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
      final response = await _homeRepo.getAllProductsAPI();
      isLoading.value = false;
      print("lsakjdkla ${response}");
      if (response != null) {
        getProductList.value = response;
        getProductFilterList.value = response;

        // Extract unique categories from the response

        categoriesList = response
            .map((product) => product.category)  // Extract the category from each product
            .where((category) => category != null) // Remove null categories
            .toSet() // Remove duplicate categories
            .toList(); // Convert the Set back to a List
        categoriesList.insert(0, "All");
        print("dsfkjskl ${categoriesList}");
        print("dsfkjskl ${categoriesList.length}");
      } else {
        getProductList.clear();
        getProductFilterList.clear();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching products: $e');
      }
      getProductList.clear();
      getProductFilterList.clear();
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


void filterProductList(String query) {
  if (query.isEmpty) {
    getProductFilterList.assignAll(getProductList);
  } else {
    getProductFilterList.assignAll(getProductList.where((product) => product.title!.toLowerCase().contains(query.toLowerCase())).toList(),
    );
  }
}

  void filterItemsByCategory(String index) {
    if(index=='All'){
      getProductFilterList.clear();
      isLoading.value=true;
          getProductFilterList.assignAll(getProductList);

      update();
    }else{
      getProductFilterList.clear();
      isLoading.value=true;
      for (var product in getProductList) {
        if (product.category == index) {
          getProductFilterList.add(product);
        }
      }

      update();
    }
    isLoading.value=false;
  }
}
