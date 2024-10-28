import 'package:get/get.dart';
import 'package:sumbertugu/navbar/navbar.dart';
import 'package:sumbertugu/pages/home/home.dart';
import 'package:sumbertugu/pages/product.dart';
import 'package:sumbertugu/pages/profile.dart';
import 'package:sumbertugu/pages/promo.dart';

class AppPage {
  static String navbar = '/';
  static String home = '/home';
  static String product = '/product';
  static String promo = '/promo';
  static String profile = '/profile';

  static getNavbar() => navbar;
  static getHome() => home;
  static getProduct() => product;
  static getPromo() => promo;
  static getProfile() => profile;

  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const Navbar()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: product, page: () => const ProductPage()),
    GetPage(name: promo, page: () => const PromoPage()),
    GetPage(name: profile, page: () => const ProfilePage()),
  ];
}
