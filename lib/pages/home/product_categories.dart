import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/sizes.dart';
import 'package:sumbertugu/controllers/navbar_controller.dart';
import 'package:sumbertugu/controllers/product_categories_controller.dart';
import 'package:sumbertugu/controllers/product_controller.dart';

class ProductCategories extends StatelessWidget {
  ProductCategories({super.key});
  final ProductCategoriesController productCategoriesController =
      Get.put(ProductCategoriesController());
  final ProductController productController = Get.put(ProductController());
  final controller = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productCategoriesController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: productCategoriesController.productCategoryItems.length,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (_, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    // Get.toNamed(AppPage.getProduct());
                    context.goNamed("product");
                    productController.currentTabIndex.value = index;
                    controller.tabIndex.value = 1;
                    controller.changeTabIndex();
                  },
                  child: Container(
                    width: 65,
                    height: 65,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: MyColors.primary),
                    ),
                    child: Image(
                      image: AssetImage(
                          'assets/images/icon/${productCategoriesController.productCategoryItems[index].name!}.png'),
                    ),
                  ),
                ),
                const Gap(3),
                Text(
                    productCategoriesController
                        .productCategoryItems[index].name!,
                    style: const TextStyle(fontSize: MySizes.fontSizeSm))
              ],
            );
          },
        );
      }
    });
  }
}
