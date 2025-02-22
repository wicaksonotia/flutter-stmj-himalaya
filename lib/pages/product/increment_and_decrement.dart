import 'package:esjerukkadiri/controllers/cart_controller.dart';
import 'package:esjerukkadiri/models/product_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../commons/colors.dart';

class IncrementAndDecrement extends StatelessWidget {
  IncrementAndDecrement({
    super.key,
    required this.dataProduct,
  });

  final CartController cartController = Get.find<CartController>();
  final ProductModel dataProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
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
              cartController.decrementProductQuantity(dataProduct);
            },
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            width: MediaQuery.of(context).size.width * 0.12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            child: Center(
              child: Obx(() {
                return Text(
                  '${cartController.getProductQuantity(dataProduct)}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary,
                  ),
                );
              }),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            iconSize: 20.0, // desired size
            onPressed: () {
              cartController.incrementProductQuantity(dataProduct);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
