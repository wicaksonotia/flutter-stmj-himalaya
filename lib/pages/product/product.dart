import 'package:esjerukkadiri/commons/containers/box_container.dart';
import 'package:esjerukkadiri/commons/currency.dart';
import 'package:esjerukkadiri/commons/sizes.dart';
import 'package:esjerukkadiri/controllers/cart_controller.dart';
import 'package:esjerukkadiri/pages/product/cart.dart';
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
    final CartController cartController = Get.find<CartController>();

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
                            CartPage(),
                          );
                        },
                        child: Row(
                          children: [
                            badges.Badge(
                              badgeContent: Text(
                                cartController.totalAllQuantity.value
                                    .toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              badgeAnimation: const badges.BadgeAnimation.fade(
                                  animationDuration:
                                      Duration(milliseconds: 400)),
                              child: const Icon(
                                Icons.shopping_bag,
                                color: MyColors.green,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            verticalSeparator(),
                            RichText(
                              text: TextSpan(
                                text: 'Rp ',
                                style: const TextStyle(
                                  fontSize: MySizes.fontSizeMd,
                                  color: MyColors.primary,
                                ),
                                children: [
                                  TextSpan(
                                    text: CurrencyFormat.convertToIdr(
                                        cartController.totalPrice.value, 0),
                                    style: const TextStyle(
                                      fontSize: MySizes.fontSizeXl,
                                      color: MyColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        onPressed: () {},
                        icon: const Icon(Icons.save),
                        color: MyColors.green,
                      ),
                      verticalSeparator(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        onPressed: () {
                          productController.toggleShowListGrid();
                        },
                        icon: Icon((productController.showListGrid.value)
                            ? Icons.grid_view_rounded
                            : Icons.format_list_bulleted_rounded),
                        color: MyColors.green,
                      ),
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

  VerticalDivider verticalSeparator() {
    return VerticalDivider(
      color: Colors.grey[300],
      thickness: 1,
      width: 20,
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
