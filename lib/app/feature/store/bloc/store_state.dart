part of 'store_bloc.dart';

class StoreState extends Equatable {
  StoreState({
    required this.store,
    this.status = FetchStatus.initial,
    List<Product>? products,
  }) {
    this.products = products ?? <Product>[];
  }

  final FetchStatus status;
  final Store store;
  late List<Product> products;

  StoreState copyWith({
    Store? store,
    FetchStatus? status,
    List<Product>? products,
  }) =>
      StoreState(
        store: store ?? this.store,
        status: status ?? this.status,
        products: products ?? this.products
      );

  @override
  List<Object?> get props => [status, store, products];
}
