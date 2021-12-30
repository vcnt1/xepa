part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

class SigninNameChanged extends SigninEvent {
  const SigninNameChanged(this.value);

  final String value;
  @override
  List<Object> get props => [value];
}

class SigninEmailChanged extends SigninEvent {
  const SigninEmailChanged(this.value);

  final String value;
  @override
  List<Object> get props => [value];
}

class SigninPasswordChanged extends SigninEvent {
  const SigninPasswordChanged(this.value);

  final String value;
  @override
  List<Object> get props => [value];
}

class SigninSubmitted extends SigninEvent {}
