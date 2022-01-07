part of 'bag_bloc.dart';

class BagState extends Equatable {
  const BagState([
    this.products = const [],
    this.total = 0.0,
  ]);

  final List<Product> products;
  final double total;

  @override
  List<Object> get props => [products, total];
}