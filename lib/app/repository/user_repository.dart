import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/barrel.dart';
import 'package:xepa/app/model/entity/credentials.dart';
import 'package:xepa/app/model/entity/entity.dart';
import 'package:xepa/app/model/entity/user.dart';
import 'package:xepa/app/model/error.dart';
import 'package:xepa/app/model/service/login_response.dart';
import 'package:xepa/app/model/service/sigin_response.dart';
import 'package:xepa/app/service/user_service.dart';

class UserRepository {
  final UserService _userService = UserService();
  User? user;

  Future<Entity<Credentials>> retrieveLoggedUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String credentials = prefs.getString("credentials") ?? '';

    try {
      final obj = credentialsFromJson(jsonDecode(credentials));

      return Entity<Credentials>(object: obj);
    } catch (e) {
      return Entity<Credentials>(error: MyError(type: ErrorType.invalidFormat));
    }
  }

  Future<Entity<LoginResponse>> logIn({
    required String email,
    required String password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await _userService.logIn(
      body: {
        "Email": email,
        "Senha": password,
      },
    );

    try {
      final loginResponse = loginResponseFromJson(res);

      prefs.setString("credentials", jsonEncode(credentialsToJson(Credentials(email: email, password: password))));
      user = loginResponse.result;
      TOKEN = loginResponse.token ?? '';
      Network().setAuthHeader();

      return Entity<LoginResponse>(object: loginResponse);
    } catch (e) {
      return Entity<LoginResponse>(error: MyApplicationHelper.parseToMyError(res, ErrorType.invalidFormat));
    }
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("credentials");
    user = null;
    TOKEN = '';
    Network().setAuthHeader();
  }

  Future<Entity<SiginResponse>> signIn({
    required String email,
    required String name,
    required String password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await _userService.signIn(
      body: {
        "Nome": name,
        "Email": email,
        "Senha": password,
        "Tipo": "Cliente",
      },
    );

    try {
      final siginInResponse = siginResponseFromJson(res);

      prefs.setString("credentials", jsonEncode(credentialsToJson(Credentials(email: email, password: password))));
      user = siginInResponse.result;
      TOKEN = siginInResponse.token;
      Network().setAuthHeader();

      return Entity<SiginResponse>(object: siginInResponse);
    } catch (e) {
      return Entity<SiginResponse>(error: MyApplicationHelper.parseToMyError(res, ErrorType.invalidFormat));
    }
  }

  Future<Entity<List<Order>>> fetchOrders() async {
    final res = await _userService.fetchOrders(userId: user?.id ?? '');

    try {
      final orders = ordersFromJson(MyApplicationHelper.formatJsonArray(res));
      return Entity<List<Order>>(object: orders);
    } catch (e) {
      return Entity<List<Order>>(error: MyApplicationHelper.parseToMyError(res, ErrorType.invalidFormat));
    }
  }

  Future<Entity<String>> order({
    required String userId,
    required String storeId,
    required List<BagProduct> products,
  }) async {
    Map<String, dynamic> body = {
      "Id_Usuario": userId,
      "Id_Estabelecimento": storeId,
      "Id_Produto": products.map((e) => e.id).toList(),
      "Quantidade": products.map((e) => e.quantidade).toList(),
      "Status_estabelecimento": "pedido recebido",
      "Status_usuario": "pedido enviado",
    };

    final res = await _userService.order(body: body);

    if (res is MyError) {
      return Entity<String>(error: res);
    }

    final String? orderId = jsonDecode(res)["Id"];

    if (orderId != null && orderId.isNotEmpty) {
      return Entity<String>(object: orderId);
    } else {
      return Entity<String>(error: MyApplicationHelper.parseToMyError(res, ErrorType.invalidFormat));
    }
  }

  Future<Entity<Order>> fetchOrderDetails(String orderId) async {
    final res = await _userService.fetchOrderDetails(orderId: orderId);

    try {
      final order = orderFromJson(MyApplicationHelper.formatJsonArray(res));
      return Entity<Order>(object: order);
    } catch (e) {
      return Entity<Order>(error: MyApplicationHelper.parseToMyError(res, ErrorType.invalidFormat));
    }
  }

  Future<bool> cancelOrder(String orderId) async {
    Map<String, String> body = {
      "Status_estabelecimento": "usuario deseja cancelar pedido",
      "Status_usuario": "Esperando restaurante cancelar pedido"
    };

    final res = await _userService.changeOrderStatus(orderId: orderId, body: body);

    return res is! MyError;
  }

  Future<bool> confirmOrderTakeAway(String orderId) async {
    Map<String, String> body = {
      "Status_estabelecimento": "Pedido Retirado",
      "Status_usuario": "Pedido Retirado"
    };

    final res = await _userService.changeOrderStatus(orderId: orderId, body: body);

    return res is! MyError;
  }
}
