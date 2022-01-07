part of 'product_bloc.dart';

class ProductState extends Equatable {
  ProductState({
    required this.product,
    required this.store,
    this.status = FetchStatus.initial,
    this.selectedQuantity = 1,
  });

  final FetchStatus status;
  final Product product;
  final Store store;
  final int selectedQuantity;

  ProductState copyWith({
    Product? product,
    Store? store,
    FetchStatus? status,
    int? selectedQuantity,
  }) =>
      ProductState(
        product: product ?? this.product,
        store: store ?? this.store,
        status: status ?? this.status,
        selectedQuantity: selectedQuantity ?? this.selectedQuantity,
      );

  @override
  List<Object?> get props => [status, product, store, selectedQuantity];
}
