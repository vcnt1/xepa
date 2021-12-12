import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/config/network.dart';
import 'package:xepa/app/helper/network_helper.dart';

class Service {
  final Network _network = Network();

  static final String url = urlApi;

  Future<dynamic> get() async => await _network.get(url);

  Future<dynamic> getRequestQueryUrl({required Map<String, String> queryParameters}) async => MyNetworkHelper.getRequestQueryUrl(url, queryParameters: queryParameters);

  Future<dynamic> post({required Map<String, String> body}) async => await _network.post(url, body: body);
}
