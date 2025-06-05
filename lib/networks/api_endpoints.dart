class ApiEndPoints {
  static const String baseUrl = 'http://103.184.181.9/apiStmj/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String login = 'loginkios';
  final String categories = 'productcategory';
  final String product = 'products';
  final String saveTransaction = 'savetransaction';
  final String getDetailTransaction = 'getdetailtransaction';
  final String transactionHistoryByMonth = 'transactionhistorybymonth';
  final String transactionHistoryByDateRange = 'transactionhistorybydaterange';
  final String deleteTransaction = 'deletetransaction';
}
