import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/data/user.dart';
import 'package:flutter_bloc_example/helper/text.dart';
import 'package:flutter_bloc_example/bloc/user_event.dart';
import 'package:flutter_bloc_example/bloc/user_state.dart';
import 'package:flutter_bloc_example/service/exception.dart';
import 'package:flutter_bloc_example/service/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitialState()) {
    on<FetchUserEvents>(_fetchUserEvents);
  }

  void _fetchUserEvents(FetchUserEvents event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      User user = await userRepository.fetchUser();
      emit(UserLoadedState(user: user));
    } on SocketException {
      emit(UserErrorState(error: NoInternetException(noInternetConnection)));
    } on HttpException {
      emit(UserErrorState(error: NoServiceFoundException(noServiceFound)));
    } on FormatException {
      emit(UserErrorState(error: FormatException(invalidResponseFormat)));
    } catch (exception) {
      emit(UserErrorState(error: UnknownException(unknownError)));
    }
  }
}
