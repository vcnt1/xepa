part of 'bag_bloc.dart';

abstract class BagEvent extends Equatable {
  const BagEvent();

  @override
  List<Object> get props => [];
}

class BagAddProduct extends BagEvent {
  const BagAddProduct(this.product, this.quantity);

  final Product product;
  final int quantity;
  @override
  List<Object> get props => [product, quantity];
}
