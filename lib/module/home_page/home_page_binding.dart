import 'package:get/get.dart';
import 'package:web_mobril_test/module/home_page/home_page_controller.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
Get.put(HomePageController());
  }
}
