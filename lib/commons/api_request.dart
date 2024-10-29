import 'dart:async';
import 'package:dio/dio.dart';
import 'package:sumbertugu/models/carousel_model.dart';
import 'package:sumbertugu/models/category_model.dart';
import 'package:sumbertugu/models/product_model.dart';
// import 'package:http/http.dart' as http;

class RemoteDataSource {
  // SLIDER
  static Future<List<CarouselModel>?> getSliderPromo() async {
    try {
      final response = await Dio().get('http://103.184.181.9/api/slider');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((e) => CarouselModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // PRODUCT CATEGORIES
  static Future<List<ProductCategoriesModel>?> getProductCategories() async {
    try {
      final response = await Dio().get('http://103.184.181.9/api/category');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((e) => ProductCategoriesModel.fromJson(e)).toList();
        // if (kDebugMode) {
        //   print(jsonData);
        // }
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // PRODUCT
  static Future<List<ProductModel>?> getProduct(int params) async {
    try {
      final response =
          await Dio().get('http://103.184.181.9/api/product?category=$params');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((e) => ProductModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // static Future<List<CarouselModel>> getSliderPromo() async {
  //   String url = 'http://103.184.181.9/api/product';
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     final List result = jsonDecode(response.body)['data'];
  //     return result.map((e) => CarouselModel.fromJson(e)).toList();
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
}
