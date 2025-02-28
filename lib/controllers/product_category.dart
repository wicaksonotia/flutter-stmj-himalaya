import 'package:esjerukkadiri/models/product_category_model.dart';
import 'package:esjerukkadiri/networks/api_request.dart';
import 'package:get/get.dart';

class ProductCategoryController extends GetxController {
  var productCategoryItems = <ProductCategoryModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProductCategory();
    super.onInit();
  }

  void fetchProductCategory() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getProductCategories();
      if (result != null) {
        productCategoryItems.assignAll(result);
      }
    } finally {
      isLoading(false);
    }
  }
}
