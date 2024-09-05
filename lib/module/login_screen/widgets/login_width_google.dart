import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/theme/app_colors.dart';
import 'package:web_mobril_test/theme/text_style.dart';
import 'package:web_mobril_test/utils/assets_image.dart';

class LoginWidthGoogle extends StatelessWidget {
  const LoginWidthGoogle({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AssetsImage.googleIcon,
              fit: BoxFit.contain,
              width: Get.width*0.08,
            ),

            Text('Login with Google',
              style: AppTextStyle.outlineButtonText,),
          ],
        ),
      );
  }
}
