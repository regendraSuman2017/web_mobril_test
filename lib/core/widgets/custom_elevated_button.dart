import 'package:web_mobril_test/core/globals.dart' as globals;


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/theme/app_colors.dart';
import 'package:web_mobril_test/theme/text_style.dart';

class CustomElevatedButton extends GetView {
  final String title;
  final VoidCallback? onPress;
  final TextStyle? textStyle;
  final Color? color;
  final ShapeBorder? shape;
  final double? elevation;
  final double? borderRadius;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPress,
    this.textStyle,
    this.color,
    this.shape,
    this.elevation,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialButton(

          onPressed: globals.isDisable.value ? () {} : onPress,
          color: color == null
              ? globals.isDisable.value
                  ? Colors.grey.shade400
                  : primaryColor
              :color ?? primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5))),
          child: Text(
              globals.isDisable.value ? 'Processing...' : title,
              style: AppTextStyle.elevatedButtonText),
        ));
  }
}
