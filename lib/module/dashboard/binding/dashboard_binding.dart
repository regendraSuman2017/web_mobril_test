import 'package:get/get.dart';
import 'package:web_mobril_test/data/home/home_repo_impl.dart';
import 'package:web_mobril_test/module/dashboard/controller/dashboard_controller.dart';
import 'package:web_mobril_test/module/home_page/home_page_controller.dart';
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<HomeRepoImpl>(() => HomeRepoImpl());
  }
}
