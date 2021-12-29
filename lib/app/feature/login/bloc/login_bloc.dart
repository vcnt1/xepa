import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:xepa/app/model/input/barrel.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()){
    on<LoginEvent>(_onEvent);
  }

  void _onEvent(LoginEvent event, Emitter<LoginState> emit) {
    if (event is LoginEmailChanged) return _onLoginEmailChanged(event, emit);
    if (event is LoginPasswordChanged) return _onLoginPasswordChanged(event, emit);
  }

  void _onLoginEmailChanged(
      LoginEmailChanged event,
      Emitter<LoginState> emit,
      ) {
    final email = Email.dirty(event.value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
    ));
  }

  void _onLoginPasswordChanged(
      LoginPasswordChanged event,
      Emitter<LoginState> emit,
      ) {
    final password = Password.dirty(event.value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }
}
