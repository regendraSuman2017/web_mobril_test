import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/module/splash/splash_controller.dart';
import 'package:web_mobril_test/theme/app_colors.dart';
import 'package:web_mobril_test/theme/text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [primaryColor, secondaryColor],
            ),
          ),
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to', style: AppTextStyle.textStyle),
                Text('Web Mobril Technology Pvt Ltd.', style: AppTextStyle.textStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
