import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/containers/search_bar_container.dart';
// import 'package:sumbertugu/commons/sizes.dart';
import 'package:sumbertugu/controllers/product_categories_controller.dart';
import 'package:sumbertugu/controllers/product_controller.dart';
import 'package:sumbertugu/pages/product/product_grid_view.dart';
import 'package:sumbertugu/pages/product/product_list_view.dart';
// import 'package:sumbertugu/pages/product/product_grid_view.dart';
// import 'package:sumbertugu/pages/product/product_list_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    final ProductCategoriesController productCategoriesController =
        Get.put(ProductCategoriesController());
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: SearchBarContainer(),
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
                                child: Obx(
                                  () => ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: productCategoriesController
                                          .productCategoryItems.length,
                                      itemBuilder: (context, index) {
                                        // print('${productController.currentTabIndex.value} =>>> $in')
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: index == 0 ? 10 : 23,
                                              top: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              productController
                                                  .onChaneTab(index);
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
            Obx(() => SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        color: MyColors.primary,
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            productController.togleShowListGrid();
                          },
                          icon: Icon((productController.showListGrid.value)
                              ? Icons.grid_view
                              : Icons.format_list_bulleted),
                          color: Colors.white,
                        ),
                      ),
                      Builder(builder: (context) {
                        if (productController.showListGrid.value) {
                          return ProductListView();
                        } else {
                          return ProductGridView();
                        }
                      }),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
