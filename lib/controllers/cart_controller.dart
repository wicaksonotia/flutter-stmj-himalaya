import 'package:esjerukkadiri/models/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> cartList = <CartModel>[].obs;

  void incrementProductQuantity(int idProduct) {
    if (cartList.any((element) => element.idProduct == idProduct)) {
      cartList
          .firstWhere((element) => element.idProduct == idProduct)
          .quantity++;
    } else {
      cartList.add(CartModel(idProduct: idProduct, quantity: 1, price: 0));
    }
  }

  void decrementProductQuantity(int idProduct) {
    if (cartList.any((element) => element.idProduct == idProduct)) {
      if (cartList
              .firstWhere((element) => element.idProduct == idProduct)
              .quantity >
          0) {
        cartList
            .firstWhere((element) => element.idProduct == idProduct)
            .quantity--;
      }
    }
  }
}
