import 'package:stmjhimalaya/login_page.dart';
import 'package:stmjhimalaya/bluetooth_setting.dart';
import 'package:stmjhimalaya/pages/report/transaction.dart';
import 'package:get/get.dart';
import 'package:stmjhimalaya/pages/product/product.dart';
import 'package:stmjhimalaya/splash_screen_page.dart';

class RouterClass {
  static String splashscreen = "/splashscreen";
  static String login = "/login";
  static String product = "/product";
  static String reporttransaction = "/reporttransaction";
  static String bluetoothSetting = "/bluetooth_setting";

  static List<GetPage> routes = [
    GetPage(page: () => const SplashScreenPage(), name: splashscreen),
    GetPage(page: () => const LoginPage(), name: login),
    GetPage(page: () => const ProductPage(), name: product),
    GetPage(page: () => const TransactionPage(), name: reporttransaction),
    GetPage(page: () => const BluetoothSetting(), name: bluetoothSetting)
  ];
}
