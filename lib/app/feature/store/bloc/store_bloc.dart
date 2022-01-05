import 'package:bloc/bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/model/entity/barrel.dart';
import 'package:xepa/app/repository/store_repository.dart';
import 'package:equatable/equatable.dart';

part 'store_event.dart';

part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc({
    required StoreRepository storeRepository,
    required Store store,
  })  : _storeRepository = storeRepository,
        super(StoreState(store: store)) {
    on<StoreEvent>(_onEvent);
  }

  final StoreRepository _storeRepository;

  void _onEvent(StoreEvent event, Emitter<StoreState> emit) {
    if (event is StoreFetchProducts) return _onStoreFetchData(event, emit);
  }

  void _onStoreFetchData(
    StoreFetchProducts event,
    Emitter<StoreState> emit,
  ) async {
    emit(state.copyWith(status: FetchStatus.loading));

    Entity<List<Product>> res = await _storeRepository.fetchStoreProducts(storeId: state.store.id ?? '');

    if (res.error != null) {
      emit(state.copyWith(status: FetchStatus.loading));
      return;
    }

    emit(state.copyWith(status: FetchStatus.success, products: res.object));
  }
}
