
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_mobril_test/theme/app_colors.dart';

class AppIconData {
  static const  IconData eye = Icons.remove_red_eye_outlined;
  static const  IconData eyeOff = Icons.visibility_off_outlined;

}


class AppIcons {


  static const   Icon backIcon = Icon(
    AppIconData.eye,
    color: darkGrey,
  );
  static const   Icon eyeOffIcon = Icon(
    AppIconData.eyeOff,
    color: darkGrey,
  );

  static Icon searchIcon = const Icon(
    CupertinoIcons.search,
    color: Colors.black54,
  );
}