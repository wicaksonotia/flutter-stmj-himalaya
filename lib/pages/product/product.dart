import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/containers/search_bar_container.dart';
import 'package:sumbertugu/controllers/product_categories_controller.dart';
import 'package:sumbertugu/controllers/product_controller.dart';
import 'package:sumbertugu/pages/product/menu.dart';
import 'package:sumbertugu/pages/product/product_grid_view.dart';
import 'package:sumbertugu/pages/product/product_list_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    final ProductCategoriesController productCategoriesController =
        Get.put(ProductCategoriesController());
    var size = MediaQuery.of(context).size;
    // Uint8List decodePhoto;

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              // title: SearchBarContainer(),
              backgroundColor: MyColors.primary,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image(
                  image: productCategoriesController
                          .productCategoryItems.isNotEmpty
                      ? MemoryImage(
                          const Base64Decoder().convert(
                              '${productCategoriesController.productCategoryItems[productCategoriesController.indexImage.value].image}'),
                        )
                      : const AssetImage('assets/images/no_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
              expandedHeight: 160,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Column(
                  children: [
                    const SearchBarContainer(),
                    Container(
                      color: Colors.white.withOpacity(.8),
                      width: size.width,
                      height: size.height * 0.04,
                      child: MenuProductCatagories(),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Visibility(
                    visible: false,
                    child: Text(
                      "${productController.currentTabIndex} ${productController.showListGrid}",
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
            )
          ],
        ),
      ),
    );
  }
}
