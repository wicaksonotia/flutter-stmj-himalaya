import 'package:esjerukkadiri/commons/containers/box_container.dart';
import 'package:esjerukkadiri/commons/currency.dart';
import 'package:esjerukkadiri/commons/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esjerukkadiri/commons/colors.dart';
import 'package:esjerukkadiri/controllers/product_controller.dart';
import 'package:esjerukkadiri/pages/product/product_grid_view.dart';
import 'package:esjerukkadiri/pages/product/product_list_view.dart';
import 'package:badges/badges.dart' as badges;

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
            backgroundColor: MyColors.primary,
            flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image(
                  image: AssetImage('assets/images/header.jpeg'),
                  fit: BoxFit.cover,
                )),
            pinned: true,
            expandedHeight: 130,
            collapsedHeight: 35,
            toolbarHeight: 30,
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              BoxContainer(
                shadow: true,
                radius: 0,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            Container(
                              height: Get.height,
                              child: Material(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      height: 5,
                                      width: Get.width / 3,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Tia Wicaksono',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'This is a bottom sheet example.',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text('Close'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            const badges.Badge(
                              badgeContent: Text(
                                '2',
                                style: TextStyle(color: Colors.white),
                              ),
                              badgeAnimation: badges.BadgeAnimation.fade(
                                  animationDuration:
                                      Duration(milliseconds: 400)),
                              child: Icon(
                                Icons.shopping_bag,
                                color: MyColors.green,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Rp',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: MySizes.fontSizeMd,
                                color: MyColors.primary,
                              ),
                            ),
                            Text(
                              CurrencyFormat.convertToIdr(1234567, 0),
                              style: const TextStyle(
                                fontSize: MySizes.fontSizeXl,
                                fontWeight: FontWeight.bold,
                                color: MyColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.save),
                        color: MyColors.green,
                      ),
                      // Text(
                      //   'Save',
                      //   style: const TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 16,
                      //   ),
                      // ),
                      IconButton(
                        onPressed: () {
                          productController.toggleShowListGrid();
                        },
                        icon: Icon((productController.showListGrid.value)
                            ? Icons.grid_view_rounded
                            : Icons.format_list_bulleted_rounded),
                        color: MyColors.green,
                      ),
                      // Text(
                      //   (productController.showListGrid.value)
                      //       ? 'Grid View'
                      //       : 'List View',
                      //   style: const TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 16,
                      //   ),
                      // ),
                    ],
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
