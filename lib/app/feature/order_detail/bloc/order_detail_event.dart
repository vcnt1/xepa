part of 'order_detail_bloc.dart';

abstract class OrderDetailEvent extends Equatable {
  const OrderDetailEvent();

  @override
  List<Object> get props => [];
}

class OrderDetailFetchData extends OrderDetailEvent{}