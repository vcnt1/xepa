part of 'bag_bloc.dart';

class BagState extends Equatable {
  BagState({
    this.products = const [],
    this.total = 0.0,
    this.store,
    this.orderId,
    this.fetchStatus = FetchStatus.iddle,
  });

  final FetchStatus fetchStatus;
  final List<BagProduct> products;
  final double total;
  Store? store;
  String? orderId;

  BagState copyWith({
    List<BagProduct>? products,
    double? total,
    Store? store,
    String? orderId,
    FetchStatus? fetchStatus,
  }) =>
      BagState(
        products: products ?? this.products,
        store: store ?? this.store,
        total: total ?? this.total,
        orderId: orderId,
        fetchStatus: fetchStatus ?? this.fetchStatus,
      );

  @override
  List<Object?> get props => [products, total, store, orderId, fetchStatus];
}