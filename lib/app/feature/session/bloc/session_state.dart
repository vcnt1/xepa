part of 'session_bloc.dart';

class SessionState extends Equatable {
  SessionState({
    required this.currentUser,
    Store? selectedStore,
  }){
    this.selectedStore = selectedStore ?? Store();
  }

  final String currentUser;
  late Store selectedStore;

  SessionState copyWith({
    String? currentUser,
    Store? selectedStore,
  }) =>
      SessionState(
        currentUser: currentUser ?? this.currentUser,
        selectedStore: selectedStore ?? this.selectedStore,
      );

  @override
  List<Object> get props => [currentUser, selectedStore];
}
