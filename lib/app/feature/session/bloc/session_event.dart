import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class SessionInitial extends SessionEvent {
  const SessionInitial(this.user);

  // final User user;
  final String user;

  @override
  List<Object> get props => [user];
}

class SessionUserLogged extends SessionEvent {}
