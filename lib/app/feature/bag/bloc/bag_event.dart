part of 'bag_bloc.dart';

abstract class BagEvent extends Equatable {
  const BagEvent();

  @override
  List<Object> get props => [];
}

class BagAddProduct extends BagEvent {
  const BagAddProduct(this.store, this.product, this.quantity);

  final Store store;
  final Product product;
  final int quantity;
  @override
  List<Object> get props => [store, product, quantity];
}

class BagProductQuantityChanged extends BagEvent {
  const BagProductQuantityChanged(this.product, this.quantity);

  final BagProduct product;
  final int quantity;
  @override
  List<Object> get props => [product, quantity];
}

class BagProductRemoved extends BagEvent {
  const BagProductRemoved(this.product);

  final BagProduct product;
  @override
  List<Object> get props => [product];
}

class BagOrderRequested extends BagEvent{}