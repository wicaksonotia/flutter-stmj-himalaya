import 'package:flutter/material.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/sizes.dart';
import 'package:sumbertugu/controllers/product_controller.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
    required this.productController,
  });

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: productController.productItems.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return Container(
          width: 65,
          height: 65,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: MyColors.primary),
          ),
          child: Text(
            productController.productItems[index].productName!,
            style: const TextStyle(fontSize: MySizes.fonztSizeSm),
          ),
        );
      },
    );
  }
}
