import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xepa/app/config/enums.dart';
import 'package:xepa/app/helper/application_helper.dart';
import 'package:xepa/app/model/entity/barrel.dart';
import 'package:xepa/app/model/entity/credentials.dart';
import 'package:xepa/app/model/error.dart';
import 'package:xepa/app/model/service/login_response.dart';
import 'package:xepa/app/repository/user_repository.dart';

part 'session_event.dart';

part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const SessionState._()) {
    on<SessionEvent>(_onEvent);
  }

  final UserRepository _userRepository;

  void _onEvent(SessionEvent event, Emitter<SessionState> emit) {
    if (event is SessionUserAuthenticated) return _onSessionUserAuthenticated(event, emit);
    if (event is SessionCheckStatus) return _onSessionCheckStatus(event, emit);
  }

  void _onSessionUserAuthenticated(
    SessionUserAuthenticated event,
    Emitter<SessionState> emit,
  ) async {
    emit(SessionState.authenticated(event.user));
  }

  void _onSessionCheckStatus(
    SessionCheckStatus event,
    Emitter<SessionState> emit,
  ) async {
    Entity<Credentials> retrieveCredentials = await MyApplicationHelper.delayedRequest(
      _userRepository.retrieveLoggedUserInfo(),
      const Duration(seconds: 2),
    );

    if (retrieveCredentials is MyError) {
      emit(const SessionState.unauthenticated());
      return;
    }

    Credentials credentials = retrieveCredentials.object!;
    Entity<LoginResponse> res = await _userRepository.logIn(
      email: credentials.email,
      password: credentials.password,
    );

    emit(SessionState.authenticated(res.object!.result ?? User.empty));
  }
}
