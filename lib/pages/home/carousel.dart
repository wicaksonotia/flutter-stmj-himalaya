import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/controllers/carousel_controller.dart';

class CarouselContainer extends StatelessWidget {
  CarouselContainer({super.key});
  final CarouselBannerController carouselController =
      Get.put(CarouselBannerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (carouselController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                initialPage: 0,
                height: 170,
                autoPlay: true,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                aspectRatio: 16 / 8,
                viewportFraction: .95,
                // autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(seconds: 5),
                // onPageChanged: (index, _) {
                //   carouselController.indexSlider.value = index;
                // },
              ),
              items: carouselController.carouselItems.map((dataSliderImage) {
                Uint8List decodePhoto;
                decodePhoto =
                    const Base64Decoder().convert('${dataSliderImage.photo}');
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: MemoryImage(decodePhoto),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),

            const Gap(10),
            // CAROUSEL INDICATOR
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                carouselController.carouselItems.length,
                (index) {
                  bool isSelected =
                      carouselController.indexSlider.value == index;
                  return GestureDetector(
                    child: AnimatedContainer(
                      width: isSelected ? 30 : 5,
                      height: 5,
                      margin:
                          EdgeInsets.symmetric(horizontal: isSelected ? 6 : 3),
                      decoration: BoxDecoration(
                        color: isSelected ? MyColors.primary : MyColors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    ),
                  );
                },
              ),
            )
          ],
        );
      }
    });
  }
}
