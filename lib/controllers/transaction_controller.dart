import 'package:esjerukkadiri/models/cart_model.dart';
import 'package:esjerukkadiri/models/transaction_model.dart';
import 'package:esjerukkadiri/networks/api_request.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class TransactionController extends GetxController {
  final isLoading = false.obs;
  final transactions = <TransactionModel>[].obs;
  final cartList = <CartModel>[].obs;

  void saveTransaction() async {
    try {
      isLoading(true);
      dio.FormData formData =
          dio.FormData.fromMap({'cartList': cartList.toList()});
      bool result = await RemoteDataSource.saveTransaction(formData);
      if (result) {
        // Fetch the updated transactions list from the server or local storage
        List<TransactionModel> updatedTransactions =
            await RemoteDataSource.getTransactions() as List<TransactionModel>;
        transactions.assignAll(updatedTransactions);
      }
    } finally {
      isLoading(false);
    }
  }
}
