import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_mobril_test/CustomAppbar.dart';
import 'package:web_mobril_test/core/icons.dart';
import 'package:web_mobril_test/core/widgets/custom_elevated_button.dart';
import 'package:web_mobril_test/core/widgets/text_Form_Field_Component.dart';
import 'package:web_mobril_test/module/login_screen/login_screen_controller.dart';
import 'package:web_mobril_test/module/login_screen/widgets/login_width_google.dart';
import 'package:web_mobril_test/responsive.dart';
import 'package:web_mobril_test/routes/app_pages.dart';
import 'package:web_mobril_test/theme/app_colors.dart';
import 'package:web_mobril_test/theme/app_font_weight.dart';
import 'package:web_mobril_test/theme/text_style.dart';
import 'package:web_mobril_test/theme/typography_constant.dart';
import 'package:web_mobril_test/utils/assets_image.dart';
import 'package:web_mobril_test/utils/validator.dart';

class LoginScreenView extends GetView<LoginScreenController>{
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.white,
        appBar: const CustomWhiteAppBar(
          elevation: 0,
          title: "Let's Login",
          spacing: 5.0,
        ),
        body: Container(
          height: Get.height*0.9,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AssetsImage.loginScreeImg,width: Get.height*0.25,alignment: Alignment.center),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User Id",style: GoogleFonts.nunitoSans(fontSize: Get.width*0.045,fontWeight: FontWeight.w700),),
                            TextFieldComponent(
                              hintText: 'Enter Email/phone'.tr,
                              obscureText: false,
                              contentPadding:EdgeInsets.all(Get.width * 0.023),
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s'),),
                              ],
                              controller: controller.emailController,
                              validator: (value) {
                                return Validator().validateEmail(value!);
                              },
                              suffixIcon:const Icon(Icons.person),

                            ),
                          ],
                        ),
                        SizedBox(height:Get.height*0.01),
                        Obx(()=>Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Password",style: GoogleFonts.nunitoSans(fontSize: Get.width*0.045,fontWeight: FontWeight.w700),),
                            TextFieldComponent(
                              hintText: 'Enter Password',
                              obscureText: controller.passwordVisibility.value?false:true,
                              contentPadding:EdgeInsets.all(Get.height * 0.025),
                              controller: controller.passwordController,
                              suffixIcon: IconButton(
                                onPressed: (){
                                  controller.passwordToggle();
                                },
                                icon: controller.passwordVisibility.value?AppIcons.backIcon:AppIcons.eyeOffIcon,
                              ),
                              validator: (value){
                                return Validator().validatePassword(value!);
                              },
                            ),
                          ],
                        )),
                        SizedBox(height:Get.height*0.01),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Reset password?'.tr,
                          style: AppTextStyle.outlineButtonText,
                        ),
                      ],
                    ),
                    SizedBox(height:Get.height*0.02),

                    SizedBox(
                        width: Get.width - 20,
                        height: Get.height * 0.07,
                        child:CustomElevatedButton(title: 'Login',
                            onPress: () async {

                                final isValid = controller.loginFormKey.currentState?.validate();
                                if (!isValid!) {
                                  return;
                                }
controller.loginUser();
                                return;
                              }

                        )
                    ),
                    SizedBox(height:Get.height*0.014),
                    Row(children: [
                      const Expanded(child: Divider(color: darkGrey,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('or continue with', style: TextStyle(fontSize: Get.width*0.038,color: darkGrey)),
                      ),
                      const Expanded(child: Divider(color: darkGrey,)),
                    ]),
                    SizedBox(height:Get.height*0.01),
                    const LoginWidthGoogle(),


                    SizedBox(height: Get.height*0.049,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${"Don't"} have an account? ',
                          style:TextStyle(
                            color: Colors.black54,
                            fontWeight: AppFontWeight.fontSemiBold,
                            letterSpacing: letterSpacing,
                            fontSize:Get.width*0.04,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(Routes.signUpScreenView);
                          },
                          child: Text('Create Account',
                            style: AppTextStyle.outlineButtonText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}