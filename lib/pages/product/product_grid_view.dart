import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:esjerukkadiri/commons/colors.dart';
import 'package:esjerukkadiri/commons/containers/box_container.dart';
import 'package:esjerukkadiri/commons/currency.dart';
import 'package:esjerukkadiri/commons/sizes.dart';
import 'package:esjerukkadiri/controllers/product_controller.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({
    super.key,
  });
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
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
              var dataProductName = controller.productItems[index].productName!;
              var dataDescription = controller.productItems[index].description!;
              var dataPrice = controller.productItems[index].price!;
              Uint8List decodePhoto;
              decodePhoto = const Base64Decoder()
                  .convert(controller.productItems[index].photo1!);

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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                image: MemoryImage(decodePhoto),
                                fit: BoxFit.cover,
                              ),
                              // image: const DecorationImage(
                              //   image: AssetImage('assets/images/kecap2.png'),
                              //   fit: BoxFit.cover,
                              // ),
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
                        const Gap(10),
                        Row(
                          children: [
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
                              CurrencyFormat.convertToIdr(dataPrice, 0),
                              style: const TextStyle(
                                fontSize: MySizes.fontSizeXl,
                                fontWeight: FontWeight.bold,
                                color: MyColors.primary,
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove_circle),
                                color: MyColors.red,
                              ),
                              const Text(
                                "0",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: MySizes.fontSizeMd),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add_circle),
                                color: MyColors.green,
                              ),
                            ],
                          ),
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
