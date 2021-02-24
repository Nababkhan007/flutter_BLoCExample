import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/bloc/user_event.dart';
import 'package:flutter_bloc_example/bloc/user_state.dart';
import 'package:flutter_bloc_example/data/user.dart';
import 'package:flutter_bloc_example/helper/text.dart';
import 'package:flutter_bloc_example/service/exception.dart';
import 'package:flutter_bloc_example/service/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;

  UserBloc({@required this.userRepository}) : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUserEvents) {
      yield UserLoadingState();
      try {
        User user = await userRepository.fetchUser();
        yield UserLoadedState(user: user);
      } on SocketException {
        yield UserErrorState(error: NoInternetException(noInternetConnection));
      } on HttpException {
        yield UserErrorState(error: NoServiceFoundException(noServiceFound));
      } on FormatException {
        yield UserErrorState(error: FormatException(invalidResponseFormat));
      } catch (exception) {
        yield UserErrorState(error: UnknownException(unknownError));
      }
    }
  }
}
