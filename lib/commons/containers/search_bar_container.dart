import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/containers/box_container.dart';
import 'package:sumbertugu/commons/widgets/text_field_widget.dart';
import 'package:sumbertugu/controllers/search_bar_controller.dart';

class SearchBarContainer extends GetWidget<SearchBarController> {
  SearchBarContainer({super.key});
  @override
  final controller = Get.put(SearchBarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          // TEXT FIELD SEARCH
          Expanded(
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
          ),
          BoxContainer(
            height: 40,
            margin: const EdgeInsets.only(left: 5),
            radius: 7,
            backgroundColor: Colors.white,
            shadow: false,
            child: IconButton(
              color: MyColors.primary,
              onPressed: () {},
              icon: const Icon(
                Icons.format_list_bulleted_rounded,
              ),
            ),
          ),
        ],
      ),
    );
    // return Expanded(
    //   child: Obx(
    //     () => TextFieldWidget(
    //       hint: "Cari produk disini..",
    //       prefixIcon: Icons.search,
    //       controller: controller.searchTextFieldController,
    //       filled: true,
    //       suffixIcon: controller.isEmptyValue.value ? null : Icons.clear,
    //       onTapSuffixIcon: () {
    //         controller.searchTextFieldController.clear();
    //         controller.isEmptyValue.value = true;
    //       },
    //       onChanged: (value) {
    //         value.isEmpty
    //             ? controller.isEmptyValue.value = true
    //             : controller.isEmptyValue.value = false;
    //       },
    //     ),
    //   ),
    // );
  }
}
