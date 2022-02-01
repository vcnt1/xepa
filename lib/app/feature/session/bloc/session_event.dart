part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class SessionStatusChanged extends SessionEvent {
  const SessionStatusChanged(this.status);

  final SessionStatus status;

  @override
  List<Object> get props => [status];
}

class SessionUserAuthenticated extends SessionEvent {
  const SessionUserAuthenticated(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class SessionLogoutRequested extends SessionEvent {}

class SessionCheckStatus extends SessionEvent {}