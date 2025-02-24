class ApiEndPoints {
  static const String baseUrl = 'http://103.184.181.9/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  // final String registerEmail = 'authaccount/registration';
  final String login = 'login';
  final String product = 'products';
  final String saveTransaction = 'savetransaction';
  final String getTransactions = 'transactions';
}
