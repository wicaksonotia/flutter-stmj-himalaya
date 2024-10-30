import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/controllers/navbar_controller.dart';
import 'package:sumbertugu/pages/home/home.dart';
import 'package:sumbertugu/pages/product/product.dart';
import 'package:sumbertugu/pages/profile.dart';
import 'package:sumbertugu/pages/promo.dart';
import 'package:iconly/iconly.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            HomePage(),
            ProductPage(),
            PromoPage(),
            ProfilePage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: MyColors.primary,
          unselectedItemColor: MyColors.grey,
          backgroundColor: Colors.white,
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          items: items,
          type: BottomNavigationBarType.fixed,
        ),
      );
    });
  }

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.edit),
      label: "Product",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.notification),
      label: "Promo",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBold.profile),
      label: "Profile",
    ),
  ];
}
