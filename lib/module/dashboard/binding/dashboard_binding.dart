import 'package:get/get.dart';
import 'package:web_mobril_test/module/dashboard/controller/dashboard_controller.dart';
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());





  }
}
