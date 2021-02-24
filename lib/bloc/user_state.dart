import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/data/user.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final User user;

  UserLoadedState({@required this.user});
}

class UserErrorState extends UserState {
  final dynamic error;

  UserErrorState({@required this.error});
}
