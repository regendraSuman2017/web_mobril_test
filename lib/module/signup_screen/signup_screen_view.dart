
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/module/signup_screen/signup_screen_controller.dart';
import 'package:web_mobril_test/responsive.dart';
import 'package:web_mobril_test/routes/app_pages.dart';
import 'package:web_mobril_test/utils/validator.dart';
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

class SignUpScreenView extends GetView<SignUpScreenController>{
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.white,
        appBar: const CustomWhiteAppBar(
          elevation: 0,
          title: "Let's Signup",
          spacing: 5.0,
        ),
        body: Container(
          height: Get.height*0.9,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: controller.formKey,
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
                        TextFieldComponent(
                              hintText: 'Enter user name',
                              obscureText: false,
                              contentPadding:EdgeInsets.all(Get.width * 0.023),
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s'),),
                              ],
                              controller: controller.nameController,
                              validator: (value) {
                                if(value!.isEmpty){
                                  return "Enter user name";
                                }
                                return null;
                              },

                            ),
                        SizedBox(height:Get.height*0.01),
                        TextFieldComponent(
                              hintText: 'Enter Email',
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


                            ),
                        SizedBox(height:Get.height*0.01),
                        TextFieldComponent(
                          hintText: 'Enter Password',
                          contentPadding:EdgeInsets.all(Get.height * 0.025),
                          controller: controller.passwordController,
                          validator: (value){
                            return Validator().validatePassword(value!);
                          },
                        ),
                        SizedBox(height:Get.height*0.01),
                      ],
                    ),

                    SizedBox(height:Get.height*0.02),

                    SizedBox(
                        width: Get.width - 20,
                        height: Get.height * 0.07,
                        child:CustomElevatedButton(title: 'Signup',
                            onPress: () async {
                              final isValid = controller.formKey.currentState?.validate();
                              if (!isValid!) {
                                return;
                              }
                              controller.registerUser();
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
                        Text('Already have an account? ',
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
                            Get.toNamed(Routes.loginScreen);
                          },
                          child: Text('Login',
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
    /*return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
          SizedBox(
            width: ResponsiveLayout.isSmallScreen(context)
                ? width
                : ResponsiveLayout.isMediumScreen(context)
                ? widthSize/1.5
                : width/1,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: ResponsiveLayout.isSmallScreen(context)
                        ? widthSize*0.07
                        : ResponsiveLayout.isMediumScreen(context)
                        ? widthSize*0.04
                        : widthSize*0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ResponsiveLayout.isSmallScreen(context)
                        ? 30
                        : ResponsiveLayout.isMediumScreen(context)
                        ? 40
                        : 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter email id',

                        labelStyle:  TextStyle(
                          fontSize: ResponsiveLayout.isSmallScreen(context)
                              ? widthSize*0.04
                              : ResponsiveLayout.isMediumScreen(context)
                              ? widthSize*0.025
                              : widthSize*0.017,
                        ),
                        contentPadding: EdgeInsets.all(
                            ResponsiveLayout.isSmallScreen(context)
                                ? widthSize*0.035
                                : ResponsiveLayout.isMediumScreen(context)
                                ? widthSize*0.035
                                : widthSize*0.017),
                        border: const OutlineInputBorder()
                    ),


                    controller: controller.emailController,
                    validator: (String? value){
                      return Validator().validateEmail(value!);
                    },
                  ),
                  const SizedBox(height: 10),
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return TextFormField(
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:  TextStyle(
                            fontSize: ResponsiveLayout.isSmallScreen(context)
                                ? widthSize*0.04
                                : ResponsiveLayout.isMediumScreen(context)
                                ? widthSize*0.025
                                : widthSize*0.017,
                          ),
                          contentPadding: EdgeInsets.all(
                              ResponsiveLayout.isSmallScreen(context)
                                  ? widthSize*0.035
                                  : ResponsiveLayout.isMediumScreen(context)
                                  ? widthSize*0.035
                                  : widthSize*0.017),

                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                        controller: controller.passwordController,
                        validator: (String? value){
                          return Validator().validatePassword(value!);
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap:  (){
                      bool isValid = controller.formKey.currentState!.validate();

                      if(!isValid){
                        return;
                      }

                      ();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:ResponsiveLayout.isSmallScreen(context)
                                  ? widthSize*0.045
                                  : ResponsiveLayout.isMediumScreen(context)
                                  ? widthSize*0.035
                                  : widthSize*0.021,),
                          )),
                    ),
                  ),
                    ),
                    const Expanded(child: Divider()),
                  ]),

                  GestureDetector(
                    onTap:  (){
                      controller.signUpWithGoogle();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: controller.isSigningUp.value
                              ? const CircularProgressIndicator(color: Colors.white,)
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/google.png',
                              height: ResponsiveLayout.isSmallScreen(context)
                              ? widthSize*0.06
                              : ResponsiveLayout.isMediumScreen(context)
                              ? widthSize*0.035
                              : widthSize*0.017),
                                   Text(
                                                              "Sign with Google",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize:ResponsiveLayout.isSmallScreen(context)
                                          ? widthSize*0.045
                                          : ResponsiveLayout.isMediumScreen(context)
                                          ? widthSize*0.035
                                          : widthSize*0.021,),
                                                            ).paddingSymmetric(horizontal: 10),
                                ],
                              )),
                    ),
                  ),
                  const SizedBox(height: 20),



                    ],
                  )
                ],
              ),
            ),
          )

        ),
      ),
    );*/
  }
}