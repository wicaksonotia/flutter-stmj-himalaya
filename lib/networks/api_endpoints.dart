class ApiEndPoints {
  static const String baseUrl = 'http://103.184.181.9/apiStmj/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String login = 'loginkios';
  final String categories = 'productcategory';
  final String product = 'products';
  final String saveDetailTransaction = 'savedetailtransaction';
  final String saveTransaction = 'savetransaction';
  final String getRowTransactions = 'gettransaction';
  final String getHistoryTransactions = 'transactions';
  final String deleteTransaction = 'deletetransaction';
  final String getTransactionDetails = 'transactiondetail';
}
