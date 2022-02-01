import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xepa/app/config/enums.dart';
import 'package:xepa/app/feature/session/bloc/session_bloc.dart';
import 'package:xepa/app/model/entity/bag_product.dart';
import 'package:xepa/app/model/entity/barrel.dart';
import 'package:xepa/app/model/entity/product.dart';
import 'package:xepa/app/repository/user_repository.dart';

part 'bag_event.dart';

part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  BagBloc({required UserRepository userRepository, required SessionBloc sessionBloc})
      : _userRepository = userRepository,
        _sessionBloc = sessionBloc,
        super(BagState()) {
    on<BagEvent>(_onEvent);
  }

  final UserRepository _userRepository;
  final SessionBloc _sessionBloc;

  void _onEvent(BagEvent event, Emitter<BagState> emit) {
    if (event is BagAddProduct) return _onBagAddProduct(event, emit);
    if (event is BagProductQuantityChanged) return _onBagProductQuantityChanged(event, emit);
    if (event is BagProductRemoved) return _onBagProductRemoved(event, emit);
    if (event is BagOrderRequested) return _onBagOrderRequested(event, emit);
  }

  void _onBagAddProduct(
    BagAddProduct event,
    Emitter<BagState> emit,
  ) {
    List<BagProduct> products = state.store?.id != event.store.id ? [] : state.products.isEmpty ? [] : state.products;

    bool notAdded = true;
    for (var el in products) {
      if (el.id == event.product.id) notAdded = false;
    }

    if (notAdded) {
      products.add(BagProduct(
        id: event.product.id ?? '',
        descricao: event.product.descricao ?? '',
        idEstabelecimento: event.product.idEstabelecimento ?? '',
        imagem: event.product.imagem ?? '',
        nome: event.product.nome ?? '',
        precoOriginal: event.product.precoOriginal ?? 0,
        precoPromocional: event.product.precoPromocional ?? 0,
        quantidade: event.quantity,
        tipo: event.product.descricao ?? '',
      ));
    }

    double total = products.fold(0, (p, BagProduct c) => p + (c.precoPromocional * c.quantidade));

    emit(state.copyWith(store: event.store, products: products, total: total));
  }

  void _onBagProductQuantityChanged(
    BagProductQuantityChanged event,
    Emitter<BagState> emit,
  ) {
    List<BagProduct> products = state.products;

    for (var el in products) {
      if (el.id == event.product.id) {
        el.quantidade = event.quantity;
      }
    }

    double total = products.fold(0, (p, BagProduct c) => p + (c.precoPromocional * c.quantidade));

    emit(state.copyWith(products: products, total: total));
  }

  void _onBagProductRemoved(
    BagProductRemoved event,
    Emitter<BagState> emit,
  ) {
    List<BagProduct> products = state.products;
    products.removeWhere((el) => el.id == event.product.id);

    double total = products.isEmpty ? 0 : products.fold(0, (p, BagProduct c) => p + (c.precoPromocional * c.quantidade));

    emit(state.copyWith(products: products, total: total));
  }

  void _onBagOrderRequested(
    BagOrderRequested event,
    Emitter<BagState> emit,
  ) async {
    emit(state.copyWith(fetchStatus: FetchStatus.loading));
    final Entity<String> res = await _userRepository.order(userId: _sessionBloc.state.user.id, storeId: state.store!.id!, products: state.products);

    if(res.error != null){
      emit(state.copyWith(fetchStatus: FetchStatus.error));
      return;
    }

    emit(state.copyWith(fetchStatus: FetchStatus.success, orderId: res.object, total: 0.0, products: const [], store: null));
  }
}
