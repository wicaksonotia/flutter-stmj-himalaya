import 'dart:ffi';

class ProductCategoriesModel {
  int? idCategories;
  String? name;
  String? image;
  Double? positionedLine;
  Double? containerWidth;

  ProductCategoriesModel(
      {this.idCategories,
      this.name,
      this.image,
      this.positionedLine,
      this.containerWidth});

  ProductCategoriesModel.fromJson(Map<String, dynamic> json) {
    idCategories = json['id_categories'];
    name = json['name'];
    image = json['image'];
    positionedLine = json['positioned_line'];
    containerWidth = json['container_width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_categories'] = idCategories;
    data['name'] = name;
    data['image'] = image;
    data['positioned_line'] = positionedLine;
    data['container_width'] = containerWidth;
    return data;
  }
}
