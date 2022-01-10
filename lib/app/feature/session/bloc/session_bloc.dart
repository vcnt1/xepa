import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xepa/app/config/enums.dart';
import 'package:xepa/app/model/entity/barrel.dart';

part 'session_event.dart';

part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(const SessionState._()) {
    on<SessionEvent>(_onEvent);
  }

  void _onEvent(SessionEvent event, Emitter<SessionState> emit) {
    if(event is SessionUserAuthenticated) return _onSessionUserAuthenticated(event, emit);
  }

  void _onSessionUserAuthenticated(
      SessionUserAuthenticated event,
      Emitter<SessionState> emit,
      ) async {
    emit(SessionState.authenticated(event.user));
  }
}
