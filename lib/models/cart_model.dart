// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:esjerukkadiri/models/product_model.dart';

class CartModel {
  final ProductModel productModel;
  final int idProduct;
  int quantity;
  CartModel({
    required this.productModel,
    required this.idProduct,
    required this.quantity,
  });

  CartModel copyWith({
    ProductModel? productModel,
    int? idProduct,
    int? quantity,
  }) {
    return CartModel(
      productModel: productModel ?? this.productModel,
      idProduct: idProduct ?? this.idProduct,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productModel': productModel,
      'idProduct': idProduct,
      'quantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      productModel:
          ProductModel.fromJson(map['productModel'] as Map<String, dynamic>),
      idProduct: map['idProduct'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CartModel(productModel: $productModel, idProduct: $idProduct, quantity: $quantity)';

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.productModel == productModel &&
        other.idProduct == idProduct &&
        other.quantity == quantity;
  }

  @override
  int get hashCode =>
      productModel.hashCode ^ idProduct.hashCode ^ quantity.hashCode;
}
