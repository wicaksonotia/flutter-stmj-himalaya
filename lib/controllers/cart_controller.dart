import 'package:esjerukkadiri/models/cart_model.dart';
import 'package:esjerukkadiri/models/product_model.dart';
import 'package:esjerukkadiri/networks/api_request.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> cartList = <CartModel>[].obs;
  var isLoading = false.obs;
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
      // print("totalQuantity: ${cartList[index].quantity}");
    } else {
      cartList.add(CartModel(
        productModel: dataProduct,
        idProduct: dataProduct.idProduct!,
        quantity: 1,
      ));
      // print("totalQuantity: ${cartList.last.quantity}");
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
        // print("totalQuantity: ${cartList[index].quantity}");
      } else {
        cartList.removeAt(index);
      }
    }

    update();
  }

  void removeProduct(ProductModel dataProduct) {
    var index = cartList
        .indexWhere((element) => element.idProduct == dataProduct.idProduct);
    if (index >= 0) {
      totalAllQuantity -= cartList[index].quantity;
      totalPrice.value -= dataProduct.price! * cartList[index].quantity;
      cartList.removeAt(index);
    }
    update();
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

  void saveCart() async {
    try {
      isLoading(true);
      var payload = cartList.map((cartItem) {
        return {
          'id_product': cartItem.idProduct,
          'product_name': cartItem.productModel.productName.toString(),
          'quantity': cartItem.quantity,
          'unit_price': cartItem.productModel.price,
          'kios': 'sumbertugu',
        };
      }).toList();
      // print(rawJson);
      var result = await RemoteDataSource.saveTransaction(payload);
      if (result) {
        print("Success");
        cartList.clear();
        totalAllQuantity = 0.obs;
        totalPrice.value = 0;
        update();
      }
    } catch (e) {
      print("Failed to save transaction: ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }

  void clearCart() {
    cartList.clear();
    totalAllQuantity = 0.obs;
    totalPrice.value = 0;
    update();
  }
}
