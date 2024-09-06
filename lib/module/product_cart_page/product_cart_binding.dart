import 'package:get/get.dart';
import 'package:web_mobril_test/module/product_cart_page/product_cart_controller.dart';

class ProductCartBinding extends Bindings{
  @override
  void dependencies() {
Get.put(ProductCartController());
  }
}
