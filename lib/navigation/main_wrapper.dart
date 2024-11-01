import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/controllers/navbar_controller.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    super.key,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final controller = Get.put(NavBarController());

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: widget.navigationShell,
        ),
        bottomNavigationBar: CustomLineIndicatorBottomNavbar(
          selectedColor: MyColors.form,
          unSelectedColor: MyColors.grey,
          backgroundColor: MyColors.primary,
          currentIndex: controller.tabIndex.value,
          unselectedIconSize: 15,
          selectedIconSize: 20,
          enableLineIndicator: true,
          lineIndicatorWidth: 3,
          indicatorType: IndicatorType.top,
          onTap: (index) {
            controller.tabIndex.value = index;
            controller.changeTabIndex();
            _goBranch(controller.tabIndex.value);
          },
          customBottomBarItems: [
            CustomBottomBarItems(
              label: 'Home',
              icon: IconlyBold.home,
              // assetsImagePath: accountImage,
              isAssetsImage: false,
            ),
            CustomBottomBarItems(
              label: 'Produk',
              icon: IconlyBold.edit,
              isAssetsImage: false,
            ),
            CustomBottomBarItems(
              label: 'Promo',
              icon: IconlyBold.notification,
              isAssetsImage: false,
            ),
            CustomBottomBarItems(
              label: 'Profil',
              icon: IconlyBold.profile,
              isAssetsImage: false,
            ),
          ],
        ),
      ),
    );
  }
}
