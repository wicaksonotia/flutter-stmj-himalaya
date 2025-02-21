// import 'dart:convert';
// import 'dart:typed_data';

import 'package:esjerukkadiri/pages/product/increment_and_decrement.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:esjerukkadiri/commons/colors.dart';
import 'package:esjerukkadiri/commons/containers/box_container.dart';
import 'package:esjerukkadiri/commons/currency.dart';
import 'package:esjerukkadiri/commons/sizes.dart';
import 'package:esjerukkadiri/controllers/product_controller.dart';
import 'package:shimmer/shimmer.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({
    super.key,
  });
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? GridView.builder(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: 6, // Number of shimmer items
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 290,
            ),
            itemBuilder: (_, index) {
              return BoxContainer(
                height: 290,
                padding: const EdgeInsets.all(10),
                shadow: true,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: 20,
                            color: Colors.grey[300],
                          ),
                        ),
                        const Gap(10),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            color: Colors.grey[300],
                          ),
                        ),
                        const Gap(10),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 80,
                            height: 20,
                            color: Colors.grey[300],
                          ),
                        ),
                        const Gap(10),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 100,
                            height: 40,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        : GridView.builder(
            padding: const EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.productItems.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              // childAspectRatio: (1 / 1.3),
              mainAxisExtent: 290,
            ),
            itemBuilder: (_, index) {
              var dataIdProduct = controller.productItems[index].idProduct!;
              var dataProductName = controller.productItems[index].productName!;
              var dataDescription = controller.productItems[index].description!;
              var dataPrice = controller.productItems[index].price!;
              // Uint8List decodePhoto;
              // decodePhoto = const Base64Decoder()
              //     .convert(controller.productItems[index].photo1!);

              return BoxContainer(
                height: 290,
                padding: const EdgeInsets.all(10),
                shadow: true,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // THUMBNAIL PRODUCT
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              // image: DecorationImage(
                              //   image: MemoryImage(decodePhoto),
                              //   fit: BoxFit.cover,
                              // ),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/orange_ice.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Text(
                          dataProductName,
                          style: const TextStyle(
                              fontSize: MySizes.fontSizeMd,
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(10),
                        Text(
                          dataDescription,
                          style: const TextStyle(
                              fontSize: MySizes.fontSizeSm,
                              color: Colors.black54),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(5),
                        Row(
                          children: [
                            const Text(
                              'Rp',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: MySizes.fontSizeMd,
                                color: MyColors.green,
                              ),
                            ),
                            Text(
                              CurrencyFormat.convertToIdr(dataPrice, 0),
                              style: const TextStyle(
                                fontSize: MySizes.fontSizeXl,
                                fontWeight: FontWeight.bold,
                                color: MyColors.green,
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Center(
                          child: IncrementAndDecrement(
                              dataIdProduct: dataIdProduct),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ));
  }
}
