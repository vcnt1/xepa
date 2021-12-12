import 'package:equatable/equatable.dart';

class SessionState extends Equatable {
  const SessionState({
    required this.currentUser,
  });

  final String currentUser;

  SessionState copyWith({
    String? currentUser,
  }) =>
      SessionState(
        currentUser: currentUser ?? this.currentUser,
      );

  @override
  List<Object> get props => [currentUser];
}
