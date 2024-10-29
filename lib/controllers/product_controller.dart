import 'package:get/get.dart';
import 'package:sumbertugu/commons/api_request.dart';
import 'package:sumbertugu/models/product_model.dart';

class ProductController extends GetxController {
  var productItems = <ProductModel>[].obs;
  var isLoading = true.obs;
  var currentTabIndex = 0.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getProduct(currentTabIndex.value + 1);
      if (result != null) {
        productItems.assignAll(result);
      }
    } finally {
      isLoading(false);
    }
  }
}
