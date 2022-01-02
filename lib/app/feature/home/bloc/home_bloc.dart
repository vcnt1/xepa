import 'package:bloc/bloc.dart';
import 'package:xepa/app/repository/store_repository.dart';

import 'home_barrel.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required StoreRepository storeRepository})
      : _storeRepository = storeRepository,
        super(const HomeState()) {
    on<HomeEvent>(_onEvent);
  }

  final StoreRepository _storeRepository;

  void _onEvent(HomeEvent event, Emitter<HomeState> emit) {
    if (event is HomeFetchData) return _onHomeFetchData(event, emit);
  }

  void _onHomeFetchData(
    HomeFetchData event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeState)
  }
}
