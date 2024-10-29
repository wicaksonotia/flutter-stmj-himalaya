import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/sizes.dart';
import 'package:sumbertugu/controllers/product_categories_controller.dart';

class ProductCategories extends StatelessWidget {
  ProductCategories({super.key});
  final ProductCategoriesController controller =
      Get.put(ProductCategoriesController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.productCategoryItems.length,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (_, index) {
            return Column(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: MyColors.primary),
                  ),
                  child: Image(
                    image: AssetImage(
                        'assets/images/icon/${controller.productCategoryItems[index].name!}.png'),
                  ),
                ),
                Text(controller.productCategoryItems[index].name!,
                    style: const TextStyle(fontSize: MySizes.fonztSizeSm))
              ],
            );
          },
        );
      }
    });
  }
}
