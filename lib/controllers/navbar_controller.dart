import 'package:get/get.dart';

class NavBarController extends GetxController {
  var tabIndex = 0.obs;
  var showButtonTogleListGrid = false.obs;

  void changeTabIndex() {
    tabIndex.value == 1
        ? showButtonTogleListGrid.value = true
        : showButtonTogleListGrid.value = false;
    update();
  }
}
