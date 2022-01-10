import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:xepa/app/feature/session/bloc/session_bloc.dart';
import 'package:xepa/app/model/entity/entity.dart';
import 'package:xepa/app/model/entity/user.dart';
import 'package:xepa/app/model/input/barrel.dart';
import 'package:xepa/app/model/service/login_response.dart';
import 'package:xepa/app/repository/user_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required UserRepository userRepository, required SessionBloc sessionBloc})
      : _userRepository = userRepository,
        _sessionBloc = sessionBloc,
        super(const LoginState()) {
    on<LoginEvent>(_onEvent);
  }

  final SessionBloc _sessionBloc;
  final UserRepository _userRepository;

  void _onEvent(LoginEvent event, Emitter<LoginState> emit) {
    if (event is LoginEmailChanged) return _onLoginEmailChanged(event, emit);
    if (event is LoginPasswordChanged) return _onLoginPasswordChanged(event, emit);
    if (event is LoginSubmitted) return _onLoginSubmitted(event, emit);
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

  void _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        Entity<LoginResponse> res = await _userRepository.logIn(
          email: state.email.value,
          password: state.password.value,
        );

        if (res.error != null) {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
          return;
        }

        _sessionBloc.add(SessionUserAuthenticated(res.object?.result ?? User.empty));
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
