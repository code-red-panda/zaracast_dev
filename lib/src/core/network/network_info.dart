import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get hasInternet;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this.internetConnection);

  final InternetConnection internetConnection;

  @override
  Future<bool> get hasInternet => internetConnection.hasInternetAccess;
}
