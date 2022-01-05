import 'dart:async';

import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/barrel.dart';
import 'package:xepa/app/service/store_service.dart';

class StoreRepository {
  final StoreService _storeService = StoreService();

  Future<Entity<List<Store>>> fetchStores() async {
    final res = await _storeService.fetchStores();
    try {
      final stores = storesFromJson(MyApplicationHelper.formatJsonArray(res));
      return Entity<List<Store>>(object: stores);
    } catch (e) {
      return Entity<List<Store>>(error: MyApplicationHelper.parseToMyError(res, ErrorType.invalidFormat));
    }
  }

  Future<Entity<List<Product>>> fetchStoreProducts({required String storeId}) async {
    final res = await _storeService.fetchStoreProducts(storeId: storeId);
    try {
      final products = productsFromJson(MyApplicationHelper.formatJsonArray(res));
      return Entity<List<Product>>(object: products);
    } catch (e) {
      return Entity<List<Product>>(error: MyApplicationHelper.parseToMyError(res, ErrorType.invalidFormat));
    }
  }
}
