import 'package:equatable/equatable.dart';
import 'package:xepa/app/config/enums.dart';
import 'package:xepa/app/model/entity/barrel.dart';

class HomeState extends Equatable {
  HomeState({
    this.status = FetchStatus.initial,
    List<Store>? stores,
  }) {
    this.stores = stores ?? <Store>[];
  }

  final FetchStatus status;
  late List<Store> stores;

  @override
  List<Object> get props => [status, stores];
}
