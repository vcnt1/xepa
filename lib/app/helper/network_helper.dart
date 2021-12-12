import 'package:xepa/app/config/network.dart';

class MyNetworkHelper {

  static Future<dynamic> getRequestQueryUrl(String url, {required Map<String, String> queryParameters}) async {
    String queryString = "?foo=foo";
    queryParameters.forEach((key, value) => queryString += '&$key=$value');

    final Network _network = Network();
    final response = await _network.get('$url/$queryString');
    return response;
  }
}