import 'package:esjerukkadiri/commons/colors.dart';
import 'package:esjerukkadiri/commons/sizes.dart';
import 'package:esjerukkadiri/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    var size = MediaQuery.of(context).size;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: .25,
      maxChildSize: .5,
      minChildSize: .2,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              if (cartController.cartList.isEmpty)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/empty_cart.png',
                        height: 100,
                      ),
                      const Gap(16),
                      Text(
                        'Your cart is empty',
                        style: TextStyle(
                          fontSize: MySizes.fontSizeXl,
                          color: Colors.black,
                        ),
                      ),
                      const Gap(16),
                      Text(
                        'Looks like you haven\'t add any item to your cart yet!',
                        style: TextStyle(
                          fontSize: MySizes.fontSizeMd,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              else
                ...cartController.cartList.map(
                  (cart) {
                    return Dismissible(
                      key: Key(cart.productModel.idProduct.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        cartController.removeProduct(cart.productModel);
                        if (cartController.cartList.isEmpty) {
                          // Trigger a rebuild to show the empty cart message
                          (context as Element).markNeedsBuild();
                        }
                      },
                      background: Container(
                        color: MyColors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: ListTile(
                        title: Text(cart.productModel.productName!),
                        subtitle: Text(
                          'Rp ${cart.productModel.price}',
                        ),
                        trailing: Text(cart.quantity.toString()),
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
