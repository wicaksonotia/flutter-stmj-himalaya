class TransactionModel {
  String? status;
  String? message;
  List<DataTransaction>? data;

  TransactionModel({this.status, this.message, this.data});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataTransaction>[];
      json['data'].forEach((v) {
        data!.add(new DataTransaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataTransaction {
  int? id;
  String? numerator;
  int? idProduct;
  String? productName;
  int? quantity;
  int? unitPrice;
  int? totalPrice;

  DataTransaction(
      {this.id,
      this.numerator,
      this.idProduct,
      this.productName,
      this.quantity,
      this.unitPrice,
      this.totalPrice});

  DataTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numerator = json['numerator'];
    idProduct = json['id_product'];
    productName = json['product_name'];
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['numerator'] = numerator;
    data['id_product'] = idProduct;
    data['product_name'] = productName;
    data['quantity'] = quantity;
    data['unit_price'] = unitPrice;
    data['total_price'] = totalPrice;
    return data;
  }
}
