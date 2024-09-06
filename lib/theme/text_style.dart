import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_mobril_test/core/globals.dart';
import 'package:web_mobril_test/theme/app_colors.dart';
import 'package:web_mobril_test/theme/app_font_size.dart';
import 'package:web_mobril_test/theme/app_font_weight.dart';

 class AppTextStyle {
  static TextStyle outlineButtonText = TextStyle(
    color: primaryColor,
    fontWeight: AppFontWeight.fontBold,
    letterSpacing: letterSpacing,
    fontSize: AppFontSize.buttonFontSize,
  );
  static TextStyle elevatedButtonText = GoogleFonts.nunitoSans(
    color : white,
    fontWeight: AppFontWeight.fontBold,
    letterSpacing:letterSpacing,
    fontSize:AppFontSize.buttonFontSize,
  );
  static TextStyle whiteAppTitle = const TextStyle(
    color: black,
    fontWeight: AppFontWeight.fontBlack,
    letterSpacing: letterSpacing,
  );
  static TextStyle appTitle = GoogleFonts.nunitoSans(
    color: white,
    fontWeight: AppFontWeight.fontBold,
    fontSize: Get.width*0.045
  );

  static TextStyle hindTextStyle = TextStyle(
    color : darkGrey,
    fontWeight: AppFontWeight.fontSemiRegular,
    letterSpacing:letterSpacing,
    fontSize:AppFontSize.hintTextFontSize,
  );

  static TextStyle  textStyle =  TextStyle(
    color: white,
    fontSize:AppFontSize.alertBoxTitle,
    fontWeight: AppFontWeight.fontBold,
  );


 }