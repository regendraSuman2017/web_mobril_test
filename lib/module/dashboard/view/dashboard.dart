import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:web_mobril_test/module/dashboard/controller/dashboard_controller.dart';
import 'package:web_mobril_test/module/home_page/home_page.dart';
import 'package:web_mobril_test/theme/app_colors.dart';

// ignore: must_be_immutable
class Dashboard extends GetView<DashboardController> {
  @override
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 50,
      controller: controller.persistentTabController,
      screens:_buildScreens(),
      items: _navBarsItems(),
      //confineInSafeArea: true,
      confineToSafeArea: true,
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
    const Center(child: Text("None Page")),
    const Center(child: Text("Setting Page")),
    const Center(child: Text("Profile Page")),
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
      icon: const Icon(Icons.favorite,size: 20),
      title: "Favorite",
      activeColorPrimary: secondaryColor,
      inactiveColorPrimary: primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings ,size: 20),
      title: "setting",
      activeColorPrimary: secondaryColor,
      inactiveColorPrimary: primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person,size: 20),
      title: "profile",
      activeColorPrimary: secondaryColor,
      inactiveColorPrimary: primaryColor,
    ),
  ];
}


