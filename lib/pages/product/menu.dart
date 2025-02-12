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
    var size = MediaQuery.of(context).size;

    return Obx(
      () =>
          // ListView.builder(
          //   physics: const BouncingScrollPhysics(),
          //   scrollDirection: Axis.horizontal,
          //   itemCount: productCategoriesController.productCategoryItems.length,
          //   itemBuilder: (context, index) {
          //     return Padding(
          //       padding: EdgeInsets.only(left: index == 0 ? 10 : 23, top: 7),
          //       child: GestureDetector(
          //         onTap: () {
          //           productController.currentTabIndex.value = index;
          //           productController.fetchProduct();
          //         },
          //         child: Text(
          //           productCategoriesController.productCategoryItems[index].name!,
          //           style: TextStyle(
          //             fontSize: productController.currentTabIndex.value == index
          //                 ? 16
          //                 : 14,
          //             fontWeight: productController.currentTabIndex.value == index
          //                 ? FontWeight.w400
          //                 : FontWeight.w300,
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          SizedBox(
        width: size.width,
        height: size.height * 0.05,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: size.width,
                height: size.height * 0.04,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        productCategoriesController.productCategoryItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(left: index == 0 ? 10 : 23, top: 7),
                        child: GestureDetector(
                          onTap: () {
                            productController.currentTabIndex.value = index;
                            productController.fetchProduct();
                            productCategoriesController.changePositionedOfLine(
                                productController.currentTabIndex.value);
                          },
                          child: Text(
                            productCategoriesController
                                .productCategoryItems[index].name!,
                            style: TextStyle(
                              fontSize:
                                  productController.currentTabIndex.value ==
                                          index
                                      ? 16
                                      : 14,
                              fontWeight:
                                  productController.currentTabIndex.value ==
                                          index
                                      ? FontWeight.w400
                                      : FontWeight.w300,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.fastLinearToSlowEaseIn,
              bottom: 0,
              left: productCategoriesController.positionedLine.value,
              duration: const Duration(milliseconds: 500),
              child: AnimatedContainer(
                margin: const EdgeInsets.only(left: 10),
                width: productCategoriesController.containerWidth.value,
                height: size.height * 0.008,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.fastLinearToSlowEaseIn,
              ),
            )
          ],
        ),
      ),
    );
  }
}
