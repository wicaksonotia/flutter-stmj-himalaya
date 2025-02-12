import 'package:get/get.dart';
import 'package:sumbertugu/commons/api_request.dart';
import 'package:sumbertugu/models/category_model.dart';

class ProductCategoriesController extends GetxController {
  var productCategoryItems = <ProductCategoriesModel>[].obs;
  var isLoading = true.obs;
  RxDouble positionedLine = 0.0.obs;
  RxDouble containerWidth = 80.0.obs;

  @override
  void onInit() {
    fetchProductCategories();
    super.onInit();
  }

  void fetchProductCategories() async {
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

  void changePositionedOfLine(int index) async {
    var result = await RemoteDataSource.getProductCategoriesById(index + 1);
    positionedLine.value = double.tryParse(result!['positioned_line'])!;
    containerWidth.value = double.tryParse(result['container_width'])!;
  }
}
