import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:xepa/app/model/entity/barrel.dart';
import 'package:xepa/app/model/input/barrel.dart';
import 'package:xepa/app/repository/user_repository.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const SigninState()) {
    on<SigninEvent>(_onEvent);
  }

  final UserRepository _userRepository;

  void _onEvent(SigninEvent event, Emitter<SigninState> emit) {
    if (event is SigninEmailChanged) return _onSigninEmailChanged(event, emit);
    if (event is SigninNameChanged) return _onSigninNameChanged(event, emit);
    if (event is SigninPasswordChanged) return _onSigninPasswordChanged(event, emit);
    if (event is SigninSubmitted) return _onSigninSubmitted(event, emit);
  }

  void _onSigninEmailChanged(
    SigninEmailChanged event,
    Emitter<SigninState> emit,
  ) {
    final email = Email.dirty(event.value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, state.name, email]),
    ));
  }

  void _onSigninPasswordChanged(
    SigninPasswordChanged event,
    Emitter<SigninState> emit,
  ) {
    final password = Password.dirty(event.value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, state.name, password]),
    ));
  }

  void _onSigninNameChanged(
    SigninNameChanged event,
    Emitter<SigninState> emit,
  ) {
    final name = Name.dirty(event.value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([state.email, state.password, name]),
    ));
  }

  void _onSigninSubmitted(
    SigninSubmitted event,
    Emitter<SigninState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        Entity<User> res = await _userRepository.signIn(
          name: state.name.value,
          email: state.email.value,
          password: state.password.value,
        );

        if(res.error != null){
          emit(state.copyWith(status: FormzStatus.submissionFailure));
          return;
        }

        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
