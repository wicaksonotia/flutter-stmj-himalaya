import 'package:esjerukkadiri/commons/containers/box_container.dart';
import 'package:esjerukkadiri/controllers/cart_controller.dart';
import 'package:esjerukkadiri/models/product_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class IncrementAndDecrement extends StatefulWidget {
  const IncrementAndDecrement({
    super.key,
    required this.dataProduct,
  });

  final ProductModel dataProduct;

  @override
  _IncrementAndDecrementState createState() => _IncrementAndDecrementState();
}

class _IncrementAndDecrementState extends State<IncrementAndDecrement> {
  final CartController cartController = Get.find<CartController>();
  var quantity = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BoxContainer(
        height: 35,
        width: MediaQuery.of(context).size.width * 0.32,
        padding: const EdgeInsets.all(3),
        radius: 5,
        showBorder: true,
        borderColor: Colors.grey.shade200,
        shadow: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              iconSize: 20.0, // desired size
              onPressed: () {
                cartController.decrementProductQuantity(widget.dataProduct);
                setState(() {
                  quantity--;
                });
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Text(
                  '${cartController.getProductQuantity(widget.dataProduct)}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              iconSize: 20.0, // desired size
              onPressed: () {
                cartController.incrementProductQuantity(widget.dataProduct);
                setState(() {
                  quantity++;
                });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      // Container(
      //   height: 35,
      //   padding: const EdgeInsets.all(3),
      //   decoration: BoxDecoration(
      //     color: MyColors.primary,
      //     borderRadius: BorderRadius.circular(5),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       IconButton(
      //         padding: EdgeInsets.zero,
      //         constraints: const BoxConstraints(),
      //         iconSize: 20.0, // desired size
      //         onPressed: () {
      //           cartController.decrementProductQuantity(widget.dataProduct);
      //           setState(() {
      //             quantity--;
      //           });
      //         },
      //         icon: const Icon(
      //           Icons.remove,
      //           color: Colors.white,
      //         ),
      //       ),
      //       Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 3),
      //         padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      //         width: MediaQuery.of(context).size.width * 0.12,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(3), color: Colors.white),
      //         child: Center(
      //           child: Text(
      //             '${cartController.getProductQuantity(widget.dataProduct)}',
      //             textAlign: TextAlign.left,
      //             style: const TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //               color: MyColors.primary,
      //             ),
      //           ),
      //         ),
      //       ),
      //       IconButton(
      //         padding: EdgeInsets.zero,
      //         constraints: const BoxConstraints(),
      //         iconSize: 20.0, // desired size
      //         onPressed: () {
      //           cartController.incrementProductQuantity(widget.dataProduct);
      //           setState(() {
      //             quantity++;
      //           });
      //         },
      //         icon: const Icon(
      //           Icons.add,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
