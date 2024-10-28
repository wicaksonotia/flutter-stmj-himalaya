class ProductCategoriesModel {
  int? idCategories;
  String? name;

  ProductCategoriesModel({this.idCategories, this.name});

  ProductCategoriesModel.fromJson(Map<String, dynamic> json) {
    idCategories = json['id_categories'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_categories'] = idCategories;
    data['name'] = name;
    return data;
  }
}
