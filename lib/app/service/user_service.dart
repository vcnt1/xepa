import 'package:shared_preferences/shared_preferences.dart';
import 'package:xepa/app/config/hosts.dart';
import 'package:xepa/app/config/network.dart';

class UserService {
  Network _network = Network();

  static final String urlLogin = '$urlApi';

  Future<dynamic> logIn(String email, String senha) async {
    var body = {
      "email": email,
      "senha": senha
    };

    var response = await _network.post('$urlLogin', body: body);
    return response;
  }

  Future<void> logOut() async {
    return await new Future<void>.delayed(
        new Duration(
            seconds: 1
        )
    );
  }
}
