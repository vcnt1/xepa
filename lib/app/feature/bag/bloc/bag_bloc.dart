import 'package:bloc/bloc.dart';
import 'package:xepa/app/model/entity/product.dart';

import 'bag_barrel.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  BagBloc() : super(const BagState()){
    on<BagEvent>(_onEvent);
  }

  void _onEvent(BagEvent event, Emitter<BagState> emit) {
    if (event is BagAddProduct) return _onBagAddProduct(event, emit);
  }

  void _onBagAddProduct(
    BagAddProduct event,
    Emitter<BagState> emit,
  ) {
    List<Product> products = state.products.isEmpty ? [] : state.products;
    products.add(event.product);

    double total = calculateTotalFromProducts(products);

    emit(BagState(products = products, total = total),
    );
  }

  double calculateTotalFromProducts(List<Product> products) => products.fold(0, (p, Product c) => p + (c.price * c.quantity));
}
