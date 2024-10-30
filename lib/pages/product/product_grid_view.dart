import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/sizes.dart';
import 'package:sumbertugu/controllers/product_controller.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({
    super.key,
  });
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.productItems.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  controller.productItems[index].productName!,
                  style: const TextStyle(fontSize: MySizes.fonztSizeSm),
                ),
              );
            },
          ));
  }
}
