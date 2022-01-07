import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xepa/app/model/entity/barrel.dart';

part 'session_event.dart';

part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionState(currentUser: 'user')) {
    on<SessionEvent>(_onEvent);
  }

  void _onEvent(SessionEvent event, Emitter<SessionState> emit) {
  }
}
