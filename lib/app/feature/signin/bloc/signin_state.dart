part of 'signin_bloc.dart';

class SigninState extends Equatable {
  const SigninState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.name = const Name.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final Email email;
  final Name name;
  final Password password;

  SigninState copyWith({
    FormzStatus? status,
    Email? email,
    Name? name,
    Password? password,
  }) {
    return SigninState(
      status: status ?? this.status,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, email, name, password];
}
