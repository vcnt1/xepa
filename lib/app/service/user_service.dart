import 'package:xepa/app/config/hosts.dart';
import 'package:xepa/app/config/network.dart';

class UserService {
  final Network _network = Network();

  static final String urlSignin = '$urlApi/usuario';
  static final String urlFetchOrders = '$urlApi/compra/getall/';
  static final String queryString1 = '?type=“usuario”';

  Future<dynamic> signIn({required Map<String, String> body}) async => await _network.post(urlSignin, body: body);

  Future<dynamic> fetchOrders({required String userId}) async => await _network.get('$urlFetchOrders/$userId$queryString1');
}
