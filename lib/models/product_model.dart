class ProductModel {
  int? idProduct;
  String? productName;
  String? categoriesName;
  String? description;
  int? price;
  String? photo1;
  bool promo = false;

  ProductModel(
      {this.idProduct,
      this.productName,
      this.categoriesName,
      this.description,
      this.price,
      this.photo1,
      this.promo = false});

  ProductModel.fromJson(Map<String, dynamic> json) {
    idProduct = json['id_product'];
    productName = json['product_name'];
    categoriesName = json['categories_name'];
    description = json['description'];
    price = json['price'];
    photo1 = json['photo_1'];
    promo = json['promo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_product'] = idProduct;
    data['product_name'] = productName;
    data['categories_name'] = categoriesName;
    data['description'] = description;
    data['price'] = price;
    data['photo_1'] = photo1;
    data['promo'] = promo;
    return data;
  }
}
