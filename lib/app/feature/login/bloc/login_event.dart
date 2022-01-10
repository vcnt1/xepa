part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitted extends LoginEvent {}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.value);

  final String value;
  @override
  List<Object> get props => [value];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.value);

  final String value;
  @override
  List<Object> get props => [value];
}


