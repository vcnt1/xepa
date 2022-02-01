import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xepa/app/config/config.dart';
import 'package:xepa/app/model/entity/barrel.dart';
import 'package:xepa/app/repository/user_repository.dart';

part 'order_detail_event.dart';
part 'order_detail_state.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  OrderDetailBloc({required this.orderId, required UserRepository userRepository})
      : _userRepository = userRepository,
        super(OrderDetailState()) {
    on<OrderDetailEvent>(_onEvent);
  }

  final String orderId;
  final UserRepository _userRepository;

  void _onEvent(OrderDetailEvent event, Emitter<OrderDetailState> emit) {
    if (event is OrderDetailFetchData) return _onOrderDetailFetchData(event, emit);
    if (event is OrderCancelRequested) return _onOrderCancelRequested(event, emit);
    if (event is OrderConfirmTakeAway) return _onOrderConfirmTakeAway(event, emit);
  }

  void _onOrderDetailFetchData(
    OrderDetailFetchData event,
    Emitter<OrderDetailState> emit,
  ) async {
    emit(OrderDetailState(status: FetchStatus.loading));

    Entity<Order> res = await _userRepository.fetchOrderDetails(orderId);

    if (res.error != null) {
      emit(OrderDetailState(status: FetchStatus.error));
      return;
    }

    emit(OrderDetailState(status: FetchStatus.success, order: res.object));
  }

  void _onOrderCancelRequested(
      OrderCancelRequested event,
      Emitter<OrderDetailState> emit,
      ) async {
    emit(OrderDetailState(status: FetchStatus.loading));
    await _userRepository.cancelOrder(orderId);
    add(OrderDetailFetchData());
  }

  void _onOrderConfirmTakeAway(
      OrderConfirmTakeAway event,
      Emitter<OrderDetailState> emit,
      ) async {
    emit(OrderDetailState(status: FetchStatus.loading));
    await _userRepository.confirmOrderTakeAway(orderId);
    add(OrderDetailFetchData());
  }
}
