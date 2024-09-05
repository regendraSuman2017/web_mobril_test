import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:web_mobril_test/module/dashboard/controller/dashboard_controller.dart';
import 'package:web_mobril_test/module/home_page/home_page.dart';
import 'package:web_mobril_test/module/product_cart_page/product_cart_view.dart';
import 'package:web_mobril_test/theme/app_colors.dart';

// ignore: must_be_immutable
class DashboardView extends GetView<DashboardController> {

  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 50,
      controller: controller.persistentTabController,
      screens:_buildScreens(),
      items: _navBarsItems(),

      stateManagement: false,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
          boxShadow: [
            const BoxShadow(
              color: lightGray,
              offset: Offset(
                0.0,
                -5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -5.0,
            ), //
          ]),

      navBarStyle: NavBarStyle.style1,

      onItemSelected: (value) async {},
    )
    ;
  }
}

List<Widget> _buildScreens() {
  return [
    const HomePage(),
    const HomePage(),
    const CartScreen(),
    const HomePage(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home,size: 25),
      title: "Home",
      activeColorPrimary: secondaryColor,
      inactiveColorPrimary: primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.access_time,size: 20),
      title: "Attendance",
      activeColorPrimary: secondaryColor,
      inactiveColorPrimary: darkGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.feed_outlined,size: 20),
      title: "Report",
      activeColorPrimary: secondaryColor,
      inactiveColorPrimary: darkGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.menu,size: 20),
      title: "Menu",
      activeColorPrimary: secondaryColor,
      inactiveColorPrimary: darkGrey,
    ),
  ];
}

