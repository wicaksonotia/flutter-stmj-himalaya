import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/widgets/text_field_widget.dart';
import 'package:sumbertugu/controllers/search_bar_controller.dart';

class SearchBarContainer extends GetWidget<SearchBarController> {
  SearchBarContainer({super.key});
  @override
  final controller = Get.put(SearchBarController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => TextFieldWidget(
          hint: "Cari produk disini..",
          prefixIcon: Icons.search,
          controller: controller.searchTextFieldController,
          filled: true,
          suffixIcon: controller.isEmptyValue.value ? null : Icons.clear,
          onTapSuffixIcon: () {
            controller.searchTextFieldController.clear();
            controller.isEmptyValue.value = true;
          },
          onChanged: (value) {
            value.isEmpty
                ? controller.isEmptyValue.value = true
                : controller.isEmptyValue.value = false;
          },
        ),
      ),
    );
  }
}
