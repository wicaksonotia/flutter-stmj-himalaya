import 'package:esjerukkadiri/networks/api_request.dart';
import 'package:get/get.dart';
import 'package:esjerukkadiri/models/product_model.dart';

class ProductController extends GetxController {
  var productItems = <ProductModel>[].obs;
  var isLoading = true.obs;
  RxInt currentTabIndex = 0.obs;
  var showListGrid = true.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    currentTabIndex.refresh();
    try {
      isLoading(true);
      var result = await RemoteDataSource.getProduct();
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

  void onChangeTab(int idx) {
    currentTabIndex(idx);
    update();
  }
}
