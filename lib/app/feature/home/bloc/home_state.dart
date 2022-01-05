part of 'home_bloc.dart';

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
