import 'package:stmjhimalaya/login_page.dart';
import 'package:stmjhimalaya/bluetooth_setting.dart';
import 'package:stmjhimalaya/pages/report/transaction.dart';
import 'package:get/get.dart';
import 'package:stmjhimalaya/pages/product/product.dart';

class RouterClass {
  static String login = "/login";
  static String product = "/product";
  static String reporttransaction = "/reporttransaction";
  static String bluetoothSetting = "/bluetooth_setting";

  static List<GetPage> routes = [
    GetPage(page: () => const LoginPage(), name: login),
    GetPage(page: () => const ProductPage(), name: product),
    GetPage(page: () => TransactionPage(), name: reporttransaction),
    GetPage(page: () => const BluetoothSetting(), name: bluetoothSetting)
  ];
}
