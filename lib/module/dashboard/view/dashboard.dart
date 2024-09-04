import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:web_mobril_test/core/icons.dart';
import 'package:web_mobril_test/module/dashboard/controller/dashboard_controller.dart';
import 'package:web_mobril_test/module/home_page/home_page.dart';

// ignore: must_be_immutable
class Dashboard extends GetView<DashboardController> {
  @override
  final controller = Get.find<DashboardController>();
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {

        },
        child: Obx(() => PersistentTabView(
              floatingActionButton: null,
              navBarHeight: 65,
              controller: controller.persistentTabController,
              stateManagement: true,
              popAllScreensOnTapOfSelectedTab: false,
              popActionScreens: PopActionScreensType.all,
              screenTransitionAnimation: const ScreenTransitionAnimation.none(),
              tabs: _navBarsItems(),
              onTabChanged: (value) {

              },
              navBarBuilder: (navBarConfig) => Style13BottomNavBar(
                navBarConfig: navBarConfig,
              ),

            )));
  }



  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        screen: HomePage(),
        item: ItemConfig(
          activeForegroundColor: Colors.black26,
          inactiveForegroundColor: Colors.black26,
          icon: AppIcons.searchIcon,
          title: ("OnHomeHomeButton".tr),
        ),
      ),

      PersistentTabConfig(
        screen: HomePage(),
        item: ItemConfig(
          activeForegroundColor: Colors.black26,
          inactiveForegroundColor: Colors.black26,
          icon: AppIcons.searchIcon,
          title: ('OnHomeSettingsButton'.tr),
          // title: ("OnHomeHomeButton".tr),
        ),
      ),
    ];
  }
}
