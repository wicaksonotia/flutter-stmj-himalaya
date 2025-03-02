class TransactionDetailModel {
  String? productName;
  int? quantity;
  int? unitPrice;
  int? totalPrice;

  TransactionDetailModel(
      {this.productName, this.quantity, this.unitPrice, this.totalPrice});

  TransactionDetailModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['quantity'] = quantity;
    data['unit_price'] = unitPrice;
    data['total_price'] = totalPrice;
    return data;
  }
}
