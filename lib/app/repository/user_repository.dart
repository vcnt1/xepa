import 'dart:async';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xepa/app/service/user_service.dart';

class UserRepository {
  final UserService _userService = UserService();
  // SharedPreferences _sharedPreferences;

  Future<dynamic> logIn({
    required String email,
    required String senha,
  }) async {
    final response = await _userService.logIn(email, senha);

    try {
      // final user = UserFromJson(response);
      return "user";
    } catch(_){
      return response;
    }
  }
}
