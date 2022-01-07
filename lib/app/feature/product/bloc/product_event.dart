part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductSelectedQuantityChanged extends ProductEvent{
  const ProductSelectedQuantityChanged(this.quantity);

  final int quantity;
  @override
  List<Object> get props => [quantity];
}