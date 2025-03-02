import 'package:stmjhimalaya/commons/colors.dart';
import 'package:stmjhimalaya/controllers/product_category.dart';
import 'package:stmjhimalaya/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoriesMenu extends StatefulWidget {
  const CategoriesMenu({super.key});

  @override
  State<CategoriesMenu> createState() => _CategoriesMenuState();
}

class _CategoriesMenuState extends State<CategoriesMenu> {
  int? groupValue = 11;
  bool selectedColor = false;
  Map<int, Widget> categories = {};
  final ProductCategoryController _productCategoryController =
      Get.find<ProductCategoryController>();
  final ProductController productController = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();
    getProductCategories();
  }

  Future<void> getProductCategories() async {
    // Simulate fetching data from an API or database
    await Future.delayed(Duration(seconds: 2));
    List<Map<String, dynamic>> fetchedCategories =
        _productCategoryController.productCategoryItems
            .map((item) => {
                  'id': item.idCategories ?? '0',
                  'name': item.name ?? 'Unknown',
                })
            .toList();

    setState(() {
      categories = {
        for (int i = 0; i < fetchedCategories.length; i++)
          fetchedCategories[i]['id']: Text(fetchedCategories[i]['name']),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: categories.length >= 2
          ? CupertinoSlidingSegmentedControl(
              backgroundColor: Colors.transparent,
              thumbColor: MyColors.green,
              padding: const EdgeInsets.all(5),
              groupValue: groupValue,
              children: categories.map((key, value) {
                return MapEntry(
                  key,
                  Text(
                    (value as Text).data ?? "",
                    style: TextStyle(
                      color: groupValue == key ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }),
              onValueChanged: (value) {
                productController.idProductCategory.value = value!;
                productController.fetchProduct();
                setState(() {
                  groupValue = value;
                });
              },
            )
          : const Text(''),
    );
  }
}
