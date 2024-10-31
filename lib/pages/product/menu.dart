import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/controllers/product_categories_controller.dart';
import 'package:sumbertugu/controllers/product_controller.dart';

class MenuProductCatagories extends StatelessWidget {
  MenuProductCatagories({
    super.key,
  });

  final ProductCategoriesController productCategoriesController =
      Get.find<ProductCategoriesController>();
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: productCategoriesController.productCategoryItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 10 : 23, top: 7),
            child: GestureDetector(
              onTap: () {
                productController.currentTabIndex.value = index;
                productController.fetchProduct();
                productCategoriesController.indexImage.value = index;
              },
              child: Text(
                productCategoriesController.productCategoryItems[index].name!,
                style: TextStyle(
                  fontSize: productController.currentTabIndex.value == index
                      ? 16
                      : 14,
                  fontWeight: productController.currentTabIndex.value == index
                      ? FontWeight.w400
                      : FontWeight.w300,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
