import 'package:get/get.dart';
import 'package:sumbertugu/commons/api_request.dart';
import 'package:sumbertugu/models/product_model.dart';

class ProductController extends GetxController {
  var productItems = <ProductModel>[].obs;
  var isLoading = true.obs;
  RxInt currentTabIndex = 0.obs;
  var showListGrid = false.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    currentTabIndex.refresh();
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

  togleShowListGrid() {
    showListGrid(!showListGrid.value);
  }

  void onChangeTab(int idx) {
    currentTabIndex(idx);
    update();
  }
}
