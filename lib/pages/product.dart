import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/sizes.dart';
import 'package:sumbertugu/controllers/product_categories_controller.dart';
import 'package:sumbertugu/controllers/product_controller.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});
  final ProductController productController = Get.put(ProductController());
  final ProductCategoriesController productCategoriesController =
      Get.put(ProductCategoriesController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Obx(() {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                // title: SearchBarContainer(),
                backgroundColor: MyColors.primary,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Image.network(
                    "https://img.freepik.com/premium-psd/free-psd-big-sale-youtube-thumbnail-design_634294-1799.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
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
                                      itemCount: productCategoriesController
                                          .productCategoryItems.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: index == 0 ? 10 : 23,
                                              top: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              productController.currentTabIndex
                                                  .value = index;

                                              productController.fetchProduct();
                                            },
                                            child: Text(
                                              productCategoriesController
                                                  .productCategoryItems[index]
                                                  .name!,
                                              style: TextStyle(
                                                fontSize: productController
                                                            .currentTabIndex
                                                            .value ==
                                                        index
                                                    ? 16
                                                    : 14,
                                                fontWeight: productController
                                                            .currentTabIndex
                                                            .value ==
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pinned: true,
                expandedHeight: 200,
              ),
              SliverToBoxAdapter(child: Builder(builder: (context) {
                if (productController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: productController.productItems.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (_, index) {
                      return Container(
                        width: 65,
                        height: 65,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: MyColors.primary),
                        ),
                        child: Text(
                          productController.productItems[index].productName!,
                          style: const TextStyle(fontSize: MySizes.fonztSizeSm),
                        ),
                      );
                    },
                  );
                }
              })),
            ],
          ),
        ),
      );
    });
  }
}
