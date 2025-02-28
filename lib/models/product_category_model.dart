class ProductCategoryModel {
  int? idCategories;
  String? name;

  ProductCategoryModel({
    this.idCategories,
    this.name,
  });

  ProductCategoryModel.fromJson(Map<String, dynamic> json) {
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
