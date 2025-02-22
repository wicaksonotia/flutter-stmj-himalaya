import 'package:esjerukkadiri/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return Container(
      height: Get.height,
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 5,
              width: Get.width / 3,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: cartController.cartList.length,
                    itemBuilder: (_, index) {
                      final cart = cartController.cartList[index];
                      return ListTile(
                        title: Text(cart.productModel.productName!),
                        subtitle: Text(
                          'Rp ${cart.productModel.price}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(cart.quantity.toString()),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
