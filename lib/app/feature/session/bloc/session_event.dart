part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class SessionInitial extends SessionEvent {
  const SessionInitial(this.user);

  final String user;

  @override
  List<Object> get props => [user];
}

class SessionUserLogged extends SessionEvent {}

class SessionSelectedStoreChanged extends SessionEvent {
  const SessionSelectedStoreChanged(this.store);

  final Store store;

  @override
  List<Object> get props => [store];
}
