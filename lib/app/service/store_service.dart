import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/config/network.dart';

class StoreService {
  final Network _network = Network();

  static final String urlStores = '$urlApi/estabelecimento';
  static final String urlStoreProducts = '$urlApi/produto/estabelecimento';

  Future<dynamic> fetchStores() async => await _network.get(urlStores);

  Future<dynamic> fetchStoreProducts({required String storeId}) async => await _network.get('$urlStoreProducts/$storeId');

  // Future<dynamic> getRequestQueryUrl({required Map<String, String> queryParameters}) async => MyNetworkHelper.getRequestQueryUrl(urlStores, queryParameters: queryParameters);
  // Future<dynamic> post({required Map<String, String> body}) async => await _network.post(url, body: body);
}
