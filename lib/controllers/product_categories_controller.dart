import 'package:get/get.dart';
import 'package:sumbertugu/commons/api_request.dart';
import 'package:sumbertugu/models/category_model.dart';

class ProductCategoriesController extends GetxController {
  var productCategoryItems = <ProductCategoriesModel>[].obs;
  var isLoading = true.obs;
  var indexImage = 0.obs;

  @override
  void onInit() {
    fetchProductCategories();
    super.onInit();
  }

  void fetchProductCategories() async {
    indexImage.refresh();
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
