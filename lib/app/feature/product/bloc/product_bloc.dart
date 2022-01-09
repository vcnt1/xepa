import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/model/entity/barrel.dart';
import 'package:xepa/app/model/entity/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required Product product,
    required Store store,
  }) : super(ProductState(product: product, store: store)) {
    on<ProductEvent>(_onEvent);
  }

  void _onEvent(ProductEvent event, Emitter<ProductState> emit) {
    if (event is ProductSelectedQuantityChanged) return _onProductSelectedQuantityChanged(event, emit);
  }

  void _onProductSelectedQuantityChanged(
    ProductSelectedQuantityChanged event,
    Emitter<ProductState> emit,
  ) {
    emit(state.copyWith(selectedQuantity: event.quantity));
  }
}
