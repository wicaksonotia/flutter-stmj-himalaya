import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/sizes.dart';
import 'package:sumbertugu/controllers/product_controller.dart';
// import 'package:sumbertugu/models/product_model.dart';

class ProductListView extends StatelessWidget {
  ProductListView({
    super.key,
  });

  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.productItems.length,
            shrinkWrap: true,
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
