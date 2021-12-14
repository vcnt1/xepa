import 'package:equatable/equatable.dart';
import 'package:xepa/app/model/entity/product.dart';

abstract class BagEvent extends Equatable {
  const BagEvent();

  @override
  List<Object> get props => [];
}

class BagAddProduct extends BagEvent {
  const BagAddProduct(this.product);

  final Product product;
  @override
  List<Object> get props => [product];
}
