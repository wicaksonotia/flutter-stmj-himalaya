import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/containers/box_container.dart';
import 'package:sumbertugu/commons/currency.dart';
import 'package:sumbertugu/commons/sizes.dart';
import 'package:sumbertugu/controllers/product_controller.dart';

class ProductListView extends StatelessWidget {
  ProductListView({
    super.key,
  });

  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.productItems.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                var dataProductName =
                    controller.productItems[index].productName!;
                var dataDescription =
                    controller.productItems[index].description!;
                var dataPrice = controller.productItems[index].price!;
                Uint8List decodePhoto;
                decodePhoto = const Base64Decoder()
                    .convert(controller.productItems[index].photo1!);

                return BoxContainer(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(5),
                  shadow: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          dataProductName,
                          style: const TextStyle(
                              fontSize: MySizes.fontSizeLg,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              //   // image: DecorationImage(
                              //   //   image: MemoryImage(decodePhoto),
                              //   //   fit: BoxFit.cover,
                              //   // ),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/kecap2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                      BoxContainer(
                                        backgroundColor: Colors.yellow.shade100,
                                        shadow: false,
                                        showBorder: true,
                                        borderColor: Colors.orange.shade100,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        radius: 3,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow.shade800,
                                              size: MySizes.iconXs,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const Text(
                                              '4.9 ',
                                              style: TextStyle(
                                                fontSize: MySizes.fontSizeXsm,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.verified,
                                        color: MyColors.green,
                                        size: MySizes.iconXs,
                                      ),
                                      Text(
                                        '1rb+ terjual',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      )
                                    ],
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
                                          color: MyColors.primary,
                                        ),
                                      ),
                                      Text(
                                        CurrencyFormat.convertToIdr(
                                            dataPrice, 0),
                                        style: const TextStyle(
                                          fontSize: MySizes.fontSizeXl,
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.primary,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
