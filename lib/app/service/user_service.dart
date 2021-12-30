import 'package:xepa/app/config/hosts.dart';
import 'package:xepa/app/config/network.dart';

class UserService {
  final Network _network = Network();

  static final String urlSignin = '$urlApi/usuario';

  Future<dynamic> signIn({required Map<String, String> body}) async => await _network.post(urlSignin, body: body);
}
