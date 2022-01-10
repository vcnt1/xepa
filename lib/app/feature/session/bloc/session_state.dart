part of 'session_bloc.dart';

class SessionState extends Equatable {
  const SessionState._({
    this.status = SessionStatus.unknown,
    this.user = User.empty,
  });

  const SessionState.unknown() : this._();

  const SessionState.authenticated(User user)
      : this._(status: SessionStatus.authenticated, user: user);

  const SessionState.unauthenticated()
      : this._(status: SessionStatus.unauthenticated);

  final SessionStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}