class ProductCategoriesModel {
  int? idCategories;
  String? name;
  String? image;

  ProductCategoriesModel({this.idCategories, this.name, this.image});

  ProductCategoriesModel.fromJson(Map<String, dynamic> json) {
    idCategories = json['id_categories'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_categories'] = idCategories;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
