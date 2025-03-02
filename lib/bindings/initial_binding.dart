import 'package:stmjhimalaya/controllers/cart_controller.dart';
import 'package:stmjhimalaya/controllers/login_controller.dart';
import 'package:stmjhimalaya/controllers/product_category.dart';
import 'package:stmjhimalaya/controllers/product_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() async {
    // Get.lazyPut<LoginController>(() => LoginController());
    Get.put<LoginController>(LoginController());
    Get.put<ProductCategoryController>(ProductCategoryController());
    Get.put<ProductController>(ProductController());
    Get.put<CartController>(CartController());
  }
}
