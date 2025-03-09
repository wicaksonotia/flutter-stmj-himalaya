import 'package:stmjhimalaya/commons/colors.dart';
import 'package:stmjhimalaya/commons/currency.dart';
import 'package:stmjhimalaya/commons/sizes.dart';
import 'package:stmjhimalaya/controllers/transaction_controller.dart';
import 'package:stmjhimalaya/pages/product/cart.dart';
import 'package:stmjhimalaya/pages/report/filter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FooterReport extends StatefulWidget {
  const FooterReport({super.key});

  @override
  State<FooterReport> createState() => _FooterReportState();
}

class _FooterReportState extends State<FooterReport> {
  final TransactionController _transactionController =
      Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height * .07,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 7,
          )
        ],
        color: Colors.white,
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Total: ',
                    style: const TextStyle(
                      fontSize: MySizes.fontSizeLg,
                      color: MyColors.primary,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Rp',
                        style: TextStyle(
                          fontSize: MySizes.fontSizeMd,
                          color: MyColors.primary,
                        ),
                      ),
                      TextSpan(
                        text: CurrencyFormat.convertToIdr(
                            _transactionController.total.value, 0),
                        style: const TextStyle(
                          fontSize: MySizes.fontSizeXl,
                          color: MyColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const FilterReport(),
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                backgroundColor: MyColors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: const TextStyle(
                  fontSize: MySizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.white,
                  ),
                  Gap(5),
                  Text(
                    'Filter',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
