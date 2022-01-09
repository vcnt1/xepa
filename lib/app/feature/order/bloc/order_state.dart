part of 'order_bloc.dart';

class OrderState extends Equatable {
  OrderState({
    List<Order>? orders,
    this.status = FetchStatus.initial,
  }){
    this.orders = orders ?? <Order>[];
  }

  final FetchStatus status;
  late List<Order> orders;

  OrderState copyWith({
    List<Order>? orders,
    FetchStatus? status,
  }) =>
      OrderState(
        orders: orders ?? this.orders,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [status, orders];
}
