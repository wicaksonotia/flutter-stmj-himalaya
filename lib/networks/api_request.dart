import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stmjhimalaya/models/product_category_model.dart';
import 'dart:convert';
import 'package:stmjhimalaya/models/product_model.dart';
import 'package:stmjhimalaya/models/transaction_detail_model.dart';
import 'package:stmjhimalaya/models/transaction_model.dart';
import 'package:stmjhimalaya/networks/api_endpoints.dart';

class RemoteDataSource {
  static Future<bool> login(FormData data) async {
    try {
      Dio dio = Dio();
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login;
      Response response = await dio.post(url,
          data: data,
          options: Options(
            contentType: Headers.jsonContentType,
          ));
      // print(response.statusCode);
      if (response.statusCode == 200) {
        if (response.data['status'] == 'ok') {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('statusLogin', true);
          await prefs.setString('username', response.data['username']);
          await prefs.setString('alamat', response.data['alamat']);
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // PRODUCT CATEGORIES
  static Future<List<ProductCategoryModel>?> getProductCategories() async {
    try {
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.categories;
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((e) => ProductCategoryModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // LIST PRODUCT
  static Future<List<ProductModel>?> getProduct(int id) async {
    try {
      var url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.product;
      final response = await Dio().get('$url?productcategory=$id');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        // print(jsonData);
        return jsonData.map((e) => ProductModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // SAVE TRANSACTION
  static Future<bool> saveTransaction(
    Map<String, dynamic> dataTransaction,
    List<dynamic> dataDetail,
  ) async {
    try {
      var rawFormat = jsonEncode({
        'transaction': dataTransaction,
        'details': dataDetail,
      });
      Dio dio = Dio();
      var url =
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.saveTransaction;
      Response response = await dio.post(
        url,
        data: rawFormat,
        options: Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  // DELETE TRANSACTION
  static Future<bool> deleteTransaction(int numerator, String kios) async {
    try {
      Dio dio = Dio();
      var url =
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.deleteTransaction;
      Response response =
          await dio.delete('$url?numerator=$numerator&kios=$kios');
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  // GET TRANSACTION DETAIL BY NUMERATOR AND KIOS
  static Future<TransactionDetailModel?> getDetailTransaction(
    Map<String, dynamic> data,
  ) async {
    try {
      var rawFormat = jsonEncode(data);
      var url = ApiEndPoints.baseUrl +
          ApiEndPoints.authEndpoints.getDetailTransaction;
      final response = await Dio().post(
        url,
        data: rawFormat,
        options: Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        final TransactionDetailModel res =
            TransactionDetailModel.fromJson(response.data);
        return res;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<TransactionModel?> transactionHistoryByDateRange(
    Map<String, dynamic> data,
  ) async {
    try {
      var rawFormat = Map<String, dynamic>.from(data);
      rawFormat['startDate'] = data['startDate'].toString();
      rawFormat['endDate'] = data['endDate'].toString();
      var url = ApiEndPoints.baseUrl +
          ApiEndPoints.authEndpoints.transactionHistoryByDateRange;
      Response response = await Dio().post(
        url,
        data: jsonEncode(rawFormat),
        options: Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        final TransactionModel res = TransactionModel.fromJson(response.data);
        return res;
      }
      return null;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  static Future<TransactionModel?> transactionHistoryByMonth(
    Map<String, dynamic> data,
  ) async {
    try {
      var rawFormat = jsonEncode(data);
      // print(rawFormat);
      var url = ApiEndPoints.baseUrl +
          ApiEndPoints.authEndpoints.transactionHistoryByMonth;
      Response response = await Dio().post(
        url,
        data: rawFormat,
        options: Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        final TransactionModel res = TransactionModel.fromJson(response.data);
        return res;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
