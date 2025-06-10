import 'package:stmjhimalaya/commons/colors.dart';
import 'package:stmjhimalaya/commons/currency.dart';
import 'package:stmjhimalaya/commons/sizes.dart';
import 'package:stmjhimalaya/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
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
            Container(
              width: 150,
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Total Cup: ${_transactionController.totalCup.value}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: MySizes.fontSizeLg,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
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
          ],
        ),
      ),
    );
  }
}
