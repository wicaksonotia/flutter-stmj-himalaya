import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sumbertugu/controllers/product_categories_controller.dart';
import 'package:sumbertugu/controllers/product_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    final ProductCategoriesController productCategoriesController =
        Get.find<ProductCategoriesController>();
    final ItemScrollController scrollController = ItemScrollController();

    return Obx(() => Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: IconButton(
                  color: Colors.red,
                  icon: const Icon(Icons.abc),
                  onPressed: () {
                    scrollController.scrollTo(
                        index: 6, duration: const Duration(seconds: 1));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                color: Colors.yellowAccent,
                height: 50,
                width: MediaQuery.sizeOf(context).height,
                child: ScrollablePositionedList.builder(
                  itemScrollController: scrollController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount:
                      productCategoriesController.productCategoryItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: index == 0 ? 10 : 23, top: 7),
                      child: GestureDetector(
                        child: Text(
                          productCategoriesController
                              .productCategoryItems[index].name!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
