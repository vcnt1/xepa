import 'dart:async';

import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/entity.dart';
import 'package:xepa/app/model/entity/user.dart';
import 'package:xepa/app/service/user_service.dart';

class UserRepository {
  final UserService _userService = UserService();

  // SharedPreferences _sharedPreferences;

  Future<Entity<User>> signIn({
    required String email,
    required String name,
    required String password,
  }) async {
    final res = await _userService.signIn(
      body: {
        "Nome": name,
        "Email": email,
        "Senha": password,
        "Tipo": "Cliente",
      },
    );

    try {
      final user = userFromJson(res);
      return Entity<User>(object: user);
    } catch (e) {
      return Entity<User>(error: MyApplicationHelper.parseToMyError(res, ErrorType.invalidFormat));
    }
  }
}
