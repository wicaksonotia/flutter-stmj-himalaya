import 'package:esjerukkadiri/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../commons/colors.dart';

class IncrementAndDecrement extends StatelessWidget {
  IncrementAndDecrement({
    super.key,
    required this.dataIdProduct,
  });

  final CartController cartController = Get.find<CartController>();
  final int dataIdProduct;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                cartController.decrementProductQuantity(dataIdProduct);
              },
              icon: const Icon(Icons.remove_circle),
              color: MyColors.red,
            ),
            const Spacer(),
            Text(
              cartController.cartList
                      .any((element) => element.idProduct == dataIdProduct)
                  ? '${cartController.cartList.firstWhere((element) => element.idProduct == dataIdProduct).quantity}'
                  : "0",
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                cartController.incrementProductQuantity(dataIdProduct);
              },
              icon: const Icon(Icons.add_circle),
              color: MyColors.green,
            ),
          ],
        ),
      ),
    );
  }
}
