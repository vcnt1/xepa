part of 'session_bloc.dart';

class SessionState extends Equatable {
  SessionState({
    required this.currentUser,
  });

  final String currentUser;

  SessionState copyWith({
    String? currentUser,
    Store? selectedStore,
  }) =>
      SessionState(
        currentUser: currentUser ?? this.currentUser,
      );

  @override
  List<Object> get props => [currentUser];
}
