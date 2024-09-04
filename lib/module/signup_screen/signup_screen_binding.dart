import 'package:get/get.dart';
import 'package:web_mobril_test/module/signup_screen/signup_screen_controller.dart';

class SignUpScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpScreenController());
  }

}