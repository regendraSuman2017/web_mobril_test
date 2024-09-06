

import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_mobril_test/routes/app_pages.dart';

class SplashController extends GetxController {


  @override
  Future<void> onReady() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  bool checkLogin = prefs.getBool('isLogin')??false;

    Timer(const Duration(seconds: 2), () async{
      (checkLogin==true)
          ? Get.offAllNamed(Routes.dashBoardScreen)
          : Get.offAllNamed(Routes.loginScreen);
    });
    super.onReady();
  }



}