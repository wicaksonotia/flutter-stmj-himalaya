import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:esjerukkadiri/commons/colors.dart';
import 'package:esjerukkadiri/controllers/product_controller.dart';
import 'package:esjerukkadiri/pages/product/product_grid_view.dart';
import 'package:esjerukkadiri/pages/product/product_list_view.dart';

class ProductOriPage extends StatelessWidget {
  const ProductOriPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    var size = MediaQuery.of(context).size;
    // Uint8List decodePhoto;

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
                image: AssetImage('assets/images/no_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            expandedHeight: 100,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
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
    );
  }
}
