import 'package:esjerukkadiri/models/cart_model.dart';
import 'package:esjerukkadiri/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> cartList = <CartModel>[].obs;
  var numberOfItems = 1.obs;
  var totalPrice = 0.obs;
  var totalAllQuantity = 0.obs;

  void incrementProductQuantity(ProductModel dataProduct) {
    if (cartList
        .where((element) => element.idProduct == dataProduct.idProduct)
        .isNotEmpty) {
      var index = cartList
          .indexWhere((element) => element.idProduct == dataProduct.idProduct);
      cartList[index].quantity++;
      print("totalQuantity: ${cartList[index].quantity}");
    } else {
      cartList.add(CartModel(
        productModel: dataProduct,
        idProduct: dataProduct.idProduct!,
        quantity: 1,
      ));
    }
    totalAllQuantity++;
    totalPrice.value += dataProduct.price!;
    update();
  }

  void decrementProductQuantity(ProductModel dataProduct) {
    var index = cartList
        .indexWhere((element) => element.idProduct == dataProduct.idProduct);
    if (index >= 0) {
      if (cartList[index].quantity > 0) {
        cartList[index].quantity--;
        totalAllQuantity--;
        totalPrice.value -= dataProduct.price!;
        print("totalQuantity: ${cartList[index].quantity}");
      } else {
        cartList.removeAt(index);
      }
    }

    update();
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

  getProductQuantity(ProductModel dataProduct) {
    var index = cartList
        .indexWhere((element) => element.idProduct == dataProduct.idProduct);
    if (index >= 0) {
      return cartList[index].quantity;
    } else {
      return 0;
    }
  }
}
