import 'package:esjerukkadiri/models/cart_model.dart';
import 'package:esjerukkadiri/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> cartList = <CartModel>[].obs;
  var numberOfItems = 1.obs;
  var totalPrice = 0.obs;
  var totalAllQuantity = 0.obs;

  void incrementProductQuantity(int idProduct) {
    if (cartList
        .where((element) => element.idProduct == idProduct)
        .isNotEmpty) {
      var index =
          cartList.indexWhere((element) => element.idProduct == idProduct);
      cartList[index].quantity++;
      print("totalQuantity: ${cartList[index].quantity}");
    } else {
      cartList.add(CartModel(
        productModel: ProductModel(idProduct: idProduct),
        idProduct: idProduct,
        quantity: 1,
      ));
    }
    totalAllQuantity++;
    print("totalAllQuantity: $totalAllQuantity");
    update();
  }

  void decrementProductQuantity(int idProduct) {
    var index =
        cartList.indexWhere((element) => element.idProduct == idProduct);
    if (cartList[index].quantity > 0) {
      cartList[index].quantity--;
      totalAllQuantity--;
      print("totalQuantity: ${cartList[index].quantity}");
    } else {
      cartList.removeAt(index);
    }
    print("totalAllQuantity: $totalAllQuantity");

    update();
  }

  int getProductQuantity(int idProduct) {
    var index =
        cartList.indexWhere((element) => element.idProduct == idProduct);
    if (index >= 0) {
      //   print("totalQuantity: ${cartList[index].quantity}");
      return cartList[index].quantity;
    } else {
      // print("totalQuantity: 0");
      return 0;
    }
    // print("total: ${cartList.length}");
  }

  void addProductToCart(ProductModel productModel) {
    final index = cartList
        .indexWhere((element) => element.idProduct == productModel.idProduct);

    // if product is exist in cartList, increment the quantity
    if (index > 0) {
      cartList[index] = CartModel(
        productModel: productModel,
        idProduct: productModel.idProduct!,
        quantity: cartList[index].quantity + numberOfItems.value,
      );
    } else {
      final cartModel = CartModel(
        productModel: productModel,
        idProduct: productModel.idProduct!,
        quantity: numberOfItems.value,
      );
      cartList.add(cartModel);
    }

    totalPrice.value =
        totalPrice.value + (productModel.price! * numberOfItems.value);
    numberOfItems.value = 1;
  }
}
