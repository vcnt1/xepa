part of 'order_detail_bloc.dart';

class OrderDetailState extends Equatable {
  OrderDetailState({
    this.status = FetchStatus.initial,
    this.order,
  });

  final FetchStatus status;
  final Order? order;

  OrderDetailState copyWith({
    Order? order,
    FetchStatus? status,
  }) =>
      OrderDetailState(
        order: order ?? this.order,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [status, order];
}
