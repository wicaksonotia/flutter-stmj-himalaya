import 'dart:typed_data';

import 'package:stmjhimalaya/pages/product/increment_and_decrement.dart';
import 'package:stmjhimalaya/pages/product/product_price.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:stmjhimalaya/commons/containers/box_container.dart';
import 'package:stmjhimalaya/commons/sizes.dart';
import 'package:stmjhimalaya/controllers/product_controller.dart';
import 'package:shimmer/shimmer.dart';

class ProductListView extends StatelessWidget {
  ProductListView({
    super.key,
  });

  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? ListView.builder(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return BoxContainer(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(5),
                  shadow: true,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: double.infinity,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const Gap(5),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: double.infinity,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const Gap(5),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 100,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.productItems.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                // var dataIdProduct = controller.productItems[index].idProduct!;
                var dataProductName =
                    controller.productItems[index].productName!;
                var dataDescription =
                    controller.productItems[index].description!;
                var dataPrice = controller.productItems[index].price!;
                var dataPhoto = controller.productItems[index].photo1;

                return BoxContainer(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  shadow: true,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 70,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(dataPhoto ?? Uint8List(0)),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dataProductName,
                              style: const TextStyle(
                                  fontSize: MySizes.fontSizeLg,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Gap(5),
                            Text(
                              dataDescription,
                              style: const TextStyle(
                                  fontSize: MySizes.fontSizeSm,
                                  color: Colors.black54),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                ProductPrice(dataPrice: dataPrice),
                                const Spacer(),
                                IncrementAndDecrement(
                                    dataProduct:
                                        controller.productItems[index]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
