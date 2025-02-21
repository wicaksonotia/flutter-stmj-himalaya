import 'package:esjerukkadiri/pages/product/increment_and_decrement.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:esjerukkadiri/commons/colors.dart';
import 'package:esjerukkadiri/commons/containers/box_container.dart';
import 'package:esjerukkadiri/commons/currency.dart';
import 'package:esjerukkadiri/commons/sizes.dart';
import 'package:esjerukkadiri/controllers/product_controller.dart';

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
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return BoxContainer(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(5),
                  shadow: true,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 20,
                                color: Colors.grey[300],
                              ),
                              const Gap(5),
                              Container(
                                width: double.infinity,
                                height: 15,
                                color: Colors.grey[300],
                              ),
                              const Gap(5),
                              Container(
                                width: 100,
                                height: 20,
                                color: Colors.grey[300],
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
                var dataIdProduct = controller.productItems[index].idProduct!;
                var dataProductName =
                    controller.productItems[index].productName!;
                var dataDescription =
                    controller.productItems[index].description!;
                var dataPrice = controller.productItems[index].price!;

                return BoxContainer(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(5),
                  shadow: true,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/orange_ice.jpg'),
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
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
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
                                  ),
                                  const Spacer(),
                                  IncrementAndDecrement(
                                      dataIdProduct: dataIdProduct)
                                ],
                              ),
                            ],
                          ),
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
