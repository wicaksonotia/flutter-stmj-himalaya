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
        height: 35,
        width: Get.width * 0.3,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                cartController.decrementProductQuantity(dataIdProduct);
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 16,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              width: Get.width * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.white),
              child: Center(
                child: Text(
                  cartController.cartList
                          .any((element) => element.idProduct == dataIdProduct)
                      ? '${cartController.cartList.firstWhere((element) => element.idProduct == dataIdProduct).quantity}'
                      : "0",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                cartController.incrementProductQuantity(dataIdProduct);
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
      // Container(
      //   width: MediaQuery.of(context).size.width * 0.35,
      //   child: Row(
      //     children: [
      //       IconButton(
      //         onPressed: () {
      //           cartController.decrementProductQuantity(dataIdProduct);
      //         },
      //         icon: const Icon(Icons.remove_circle),
      //         color: MyColors.red,
      //       ),
      //       const Spacer(),
      //       Text(
      //         cartController.cartList
      //                 .any((element) => element.idProduct == dataIdProduct)
      //             ? '${cartController.cartList.firstWhere((element) => element.idProduct == dataIdProduct).quantity}'
      //             : "0",
      //         textAlign: TextAlign.left,
      //         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //       ),
      //       const Spacer(),
      //       IconButton(
      //         onPressed: () {
      //           cartController.incrementProductQuantity(dataIdProduct);
      //         },
      //         icon: const Icon(Icons.add_circle),
      //         color: MyColors.green,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
