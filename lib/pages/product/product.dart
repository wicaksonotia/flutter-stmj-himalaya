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
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductController productController;
  late CartController cartController;

  @override
  void initState() {
    super.initState();
    productController = Get.find<ProductController>();
    cartController = Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          productController.fetchProduct();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                PopupMenuButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onSelected: (dynamic value) {},
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: Obx(
                        () => ListTile(
                          leading: Icon(
                            (productController.showListGrid.value)
                                ? Icons.grid_view_rounded
                                : Icons.format_list_bulleted_rounded,
                          ),
                          title: Text((productController.showListGrid.value)
                              ? 'Grid view'
                              : 'List view'),
                          onTap: () {
                            productController.showListGrid.value =
                                !productController.showListGrid.value;
                          },
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.edit_document),
                        title: Text('Report'),
                      ),
                    ),
                    const PopupMenuDivider(),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.bluetooth_searching),
                        title: const Text('Setting Bluetooth'),
                        onTap: () => Get.toNamed('/bluetooth_setting'),
                      ),
                    ),
                    const PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                      ),
                    ),
                  ],
                ),
              ],
              backgroundColor: MyColors.primary,
              flexibleSpace: const FlexibleSpaceBar(
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
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => const CartPage(),
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))));
                          },
                          child: Row(
                            children: [
                              badges.Badge(
                                badgeContent: Text(
                                  cartController.totalAllQuantity.value
                                      .toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                badgeAnimation:
                                    const badges.BadgeAnimation.fade(
                                        animationDuration:
                                            Duration(milliseconds: 400)),
                                child: const Icon(
                                  Icons.shopping_bag,
                                  size: 30,
                                  color: MyColors.green,
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
                          onPressed: () {
                            cartController.saveCart();
                          },
                          icon: const Icon(Icons.save),
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
              child: Obx(() {
                return productController.showListGrid.value
                    ? ProductListView()
                    : ProductGridView();
              }),
            )
          ],
        ),
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
