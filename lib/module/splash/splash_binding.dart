import 'package:get/get.dart';
import 'package:web_mobril_test/data/home/home_repo_impl.dart';
import 'package:web_mobril_test/module/splash/splash_controller.dart';
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeRepoImpl());
    Get.put(SplashController());
  }
}
