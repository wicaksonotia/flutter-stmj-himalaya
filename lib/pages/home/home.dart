import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sumbertugu/commons/colors.dart';
import 'package:sumbertugu/commons/containers/box_container.dart';
import 'package:sumbertugu/pages/home/product_categories.dart';
import 'package:sumbertugu/pages/home/keunggulan_container.dart';
import 'package:sumbertugu/commons/containers/search_bar_container.dart';
import 'package:sumbertugu/pages/home/see_all_container.dart';
import 'package:sumbertugu/pages/home/carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            // HEADER
            Stack(
              children: [
                // BACKGROUND HEADER
                Container(
                  height: 155,
                  // color: MyColors.primary,
                  decoration: const BoxDecoration(
                    color: MyColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),

                // SEARCH BAR HEADER
                Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        const SearchBarContainer(),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            // color: MyColors.red,
                            width: MediaQuery.sizeOf(context).width * .9,
                            child: Row(
                              children: [
                                KeunggulanContainer(
                                  image: 'assets/images/delivery.png',
                                  text: "GRATIS ONGKIR *",
                                ),
                                const Spacer(),
                                KeunggulanContainer(
                                  image: 'assets/images/retur.png',
                                  text: "GARANSI RETUR",
                                ),
                                const Spacer(),
                                KeunggulanContainer(
                                  image: 'assets/images/delivery_time.png',
                                  text: "KIRIM \nHARI INI",
                                ),
                                const Spacer(),
                                KeunggulanContainer(
                                  image: 'assets/images/24-hours-support.png',
                                  text: "24 JAM\nPELAYANAN",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),

                // KEUNGGULAN
              ],
            ),
            const Gap(20),

            // CAROUSEL SLIDER
            const SeeAllContainer(
              header: "Special Offer",
              subHeader: "Easy with promo code",
              buttonLihatSemua: true,
            ),
            const Gap(10),
            CarouselContainer(),
            const Gap(10),

            // PRODUCT CATEGORIES
            const SeeAllContainer(
              header: "Other Services",
              subHeader: "",
              buttonLihatSemua: false,
            ),
            const Gap(10),
            BoxContainer(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              width: MediaQuery.of(context).size.width,
              radius: 7,
              shadow: true,
              showBorder: true,
              borderColor: MyColors.grey,
              child: ProductCategories(),
            ),
          ],
        ),
      ),
    );
  }
}
