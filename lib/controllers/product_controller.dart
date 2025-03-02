import 'package:stmjhimalaya/networks/api_request.dart';
import 'package:get/get.dart';
import 'package:stmjhimalaya/models/product_model.dart';

class ProductController extends GetxController {
  var productItems = <ProductModel>[].obs;
  var idProductCategory = 11.obs;
  var isLoading = true.obs;
  var showListGrid = true.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getProduct(idProductCategory.value);
      if (result != null) {
        productItems.assignAll(result);
      }
    } finally {
      isLoading(false);
    }
  }

  toggleShowListGrid() {
    showListGrid(!showListGrid.value);
  }
}
