import 'package:stmjhimalaya/commons/colors.dart';
import 'package:stmjhimalaya/commons/currency.dart';
import 'package:stmjhimalaya/commons/sizes.dart';
import 'package:flutter/cupertino.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.dataPrice,
  });

  final int dataPrice;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'Rp ',
            style: const TextStyle(
              color: MyColors.green,
              fontSize: MySizes.fontSizeMd,
            ),
          ),
          TextSpan(
            text: CurrencyFormat.convertToIdr(dataPrice, 0),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MySizes.fontSizeXl,
              color: MyColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
