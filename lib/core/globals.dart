
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxString token = "".obs;
RxString currentAddress = ''.obs;
RxBool addressLoader = false.obs;

RxBool isDisable = false.obs;
RxDouble longitude = 0.0.obs;
RxDouble latitude = 0.0.obs;
final GlobalKey<ScaffoldState> scaffoldKeyN =  GlobalKey<ScaffoldState>();

bool isFrontOrNot = true;
bool isLocPermissionShow = false;


RxBool checkNet = true.obs;