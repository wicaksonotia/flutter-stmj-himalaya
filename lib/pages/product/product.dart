import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esjerukkadiri/commons/colors.dart';
import 'package:esjerukkadiri/controllers/product_controller.dart';
import 'package:esjerukkadiri/pages/product/product_grid_view.dart';
import 'package:esjerukkadiri/pages/product/product_list_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            // title: SearchBarContainer(),
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image(
                  image: AssetImage('assets/images/no_image.jpg'),
                  fit: BoxFit.cover,
                )),
            pinned: true,
            expandedHeight: 200,
            collapsedHeight: 35,
            toolbarHeight: 30,
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              Container(
                color: MyColors.primary.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Obx(
                    () =>
                        // Container(
                        //           decoration: BoxDecoration(
                        //             color:
                        //                 Colors.blue, // Background color of the button
                        //             borderRadius:
                        //                 BorderRadius.circular(8), // Rounded corners
                        //           ),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: [
                        //               IconButton(
                        //                 onPressed: () {
                        //                   productController.toggleShowListGrid();
                        //                 },
                        //                 icon: Icon((productController
                        //                         .showListGrid.value)
                        //                     ? Icons.grid_view
                        //                     : Icons.format_list_bulleted_outlined),
                        //                 color: Colors.white,
                        //               ),
                        //               Text(
                        //                 (productController.showListGrid.value)
                        //                     ? 'Grid View'
                        //                     : 'List View',
                        //                 style: const TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 16,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         )
                        Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            productController.toggleShowListGrid();
                          },
                          icon: Icon((productController.showListGrid.value)
                              ? Icons.grid_view
                              : Icons.format_list_bulleted_outlined),
                          color: Colors.white,
                        ),
                        Text(
                          (productController.showListGrid.value)
                              ? 'Grid View'
                              : 'List View',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Obx(() {
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
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget _widget;

  _SliverAppBarDelegate(this._widget);

  @override
  double get minExtent => 40.0;

  @override
  double get maxExtent => 40.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _widget;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
