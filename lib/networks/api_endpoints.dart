class ApiEndPoints {
  static const String baseUrl = 'http://103.184.181.9/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String login = 'loginkios';
  final String categories = 'productcategorystmj';
  final String product = 'products';
  final String saveTransaction = 'savetransactionstmj';
  final String getTransactions = 'transactionsstmj';
  final String deleteTransaction = 'deletetransactionstmj';
  final String getTransactionDetails = 'transactiondetailstmj';
}
