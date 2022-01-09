import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/model/entity/barrel.dart';
import 'package:xepa/app/repository/user_repository.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(OrderState()) {
    on<OrderEvent>(_onEvent);
  }

  final UserRepository _userRepository;

  void _onEvent(OrderEvent event, Emitter<OrderState> emit) {
    if (event is OrderFetchData) return _onOrderFetchData(event, emit);
  }

  void _onOrderFetchData(
    OrderFetchData event,
    Emitter<OrderState> emit,
  ) async {
    emit(OrderState(status: FetchStatus.loading));

    Entity<List<Order>> res = await _userRepository.fetchOrders('0c160030-5c45-11ec-8b9d-07c49bb26317');

    if (res.error != null) {
      emit(OrderState(status: FetchStatus.error));
      return;
    }

    emit(OrderState(status: FetchStatus.success, orders: res.object));
  }
}
