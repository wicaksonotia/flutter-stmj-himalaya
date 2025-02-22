import 'package:esjerukkadiri/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../commons/colors.dart';

class IncrementAndDecrement extends StatelessWidget {
  IncrementAndDecrement({
    super.key,
    required this.dataIdProduct,
    required this.dataPrice,
  });

  final CartController cartController = Get.find<CartController>();
  final int dataIdProduct;
  final int dataPrice;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 35,
        // width: Get.width * 0.3,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              iconSize: 20.0, // desired size
              onPressed: () {
                cartController.decrementProductQuantity(
                    dataIdProduct, dataPrice);
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              width: Get.width * 0.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.white),
              child: Center(
                child: Text(
                  cartController.getProductQuantity(dataIdProduct).toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary,
                  ),
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              iconSize: 20.0, // desired size
              onPressed: () {
                cartController.incrementProductQuantity(
                    dataIdProduct, dataPrice);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
