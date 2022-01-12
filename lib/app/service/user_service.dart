import 'package:xepa/app/config/hosts.dart';
import 'package:xepa/app/config/network.dart';

class UserService {
  final Network _network = Network();

  static final String urlSignin = '$urlApi/usuario';
  static final String urlLogin = '$urlApi/usuario/login';

  static final String urlOrder = '$urlApi/compra';
  static final String urlFetchOrders = '$urlApi/compra/getall';
  static const String queryString1 = '?type=usuario';

  Future<dynamic> signIn({required Map<String, String> body}) async => await _network.post(urlSignin, body: body);

  Future<dynamic> logIn({required Map<String, String> body}) async => await _network.post(urlLogin, body: body);

  Future<dynamic> order({required Map<String, dynamic> body}) async => await _network.post(urlOrder, body: body);

  Future<dynamic> fetchOrders({required String userId}) async => await _network.get('$urlFetchOrders/$userId$queryString1');

  Future<dynamic> fetchOrderDetails({required String orderId}) async => await _network.get('$urlOrder/$orderId');
}
