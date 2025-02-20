import 'package:esjerukkadiri/controllers/product_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() async {
    // Get.lazyPut<LoginController>(() => LoginController());
    Get.put<ProductController>(ProductController());
  }
}
