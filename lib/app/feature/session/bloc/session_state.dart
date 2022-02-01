part of 'session_bloc.dart';

class SessionState extends Equatable {
  const SessionState._({
    this.status = SessionStatus.initial,
    this.user = User.empty,
  });

  const SessionState.unknown()  : this._(status: SessionStatus.unknown);

  const SessionState.authenticated(User user)
      : this._(status: SessionStatus.authenticated, user: user);

  const SessionState.unauthenticated()
      : this._(status: SessionStatus.unauthenticated);

  final SessionStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}