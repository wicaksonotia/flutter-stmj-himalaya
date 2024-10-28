import 'package:get/get.dart';
import 'package:sumbertugu/commons/api_request.dart';
import 'package:sumbertugu/models/carousel_model.dart';

class CarouselBannerController extends GetxController {
  var carouselItems = <CarouselModel>[].obs;
  var isLoading = true.obs;
  RxInt indexSlider = 0.obs;

  @override
  void onInit() {
    fetchCarousel();
    super.onInit();
  }

  void fetchCarousel() async {
    try {
      isLoading(true);
      var result = await RemoteDataSource.getSliderPromo();
      if (result != null) {
        carouselItems.assignAll(result);
      }
    } finally {
      isLoading(false);
    }
  }
}
