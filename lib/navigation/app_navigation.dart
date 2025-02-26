import 'package:esjerukkadiri/login_page.dart';
import 'package:esjerukkadiri/bluetooth_setting.dart';
import 'package:get/get.dart';
import 'package:esjerukkadiri/pages/product/product.dart';

class RouterClass {
  static String login = "/login";
  static String product = "/product";
  static String bluetoothSetting = "/bluetooth_setting";

  static List<GetPage> routes = [
    GetPage(page: () => LoginPage(), name: login),
    GetPage(page: () => const ProductPage(), name: product),
    GetPage(page: () => const BluetoothSetting(), name: bluetoothSetting),
  ];
}
