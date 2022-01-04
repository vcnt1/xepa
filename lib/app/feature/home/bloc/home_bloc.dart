import 'package:bloc/bloc.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/model/entity/barrel.dart';
import 'package:xepa/app/repository/store_repository.dart';

import 'home_barrel.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required StoreRepository storeRepository})
      : _storeRepository = storeRepository,
        super(HomeState()) {
    on<HomeEvent>(_onEvent);
  }

  final StoreRepository _storeRepository;

  void _onEvent(HomeEvent event, Emitter<HomeState> emit) {
    if (event is HomeFetchData) return _onHomeFetchData(event, emit);
  }

  void _onHomeFetchData(
    HomeFetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeState(status: FetchStatus.loading));

    Entity<List<Store>> res = await _storeRepository.fetchStores();

    if(res.error != null){
      emit(HomeState(status: FetchStatus.error));
      return;
    }

    emit(HomeState(status: FetchStatus.success, stores: res.object));
  }
}
