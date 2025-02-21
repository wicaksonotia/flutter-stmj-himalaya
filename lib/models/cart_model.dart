class CartModel {
  int idProduct;
  int quantity;
  double price;

  CartModel({
    required this.idProduct,
    required this.quantity,
    required this.price,
  });

  double get totalPrice => price * quantity;

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      idProduct: json['idProduct'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idProduct': idProduct,
      'quantity': quantity,
      'price': price,
    };
  }
}
