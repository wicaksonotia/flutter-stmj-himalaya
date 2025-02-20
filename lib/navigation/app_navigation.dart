import 'package:esjerukkadiri/login_page.dart';
import 'package:get/get.dart';
import 'package:esjerukkadiri/pages/product/product.dart';

class RouterClass {
  static String login = "/login";
  static String product = "/product";

  static List<GetPage> routes = [
    GetPage(page: () => LoginPage(), name: login),
    GetPage(page: () => ProductPage(), name: product),
  ];
}
