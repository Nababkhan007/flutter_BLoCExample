import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/helper/text.dart';
import 'package:flutter_bloc_example/ui/user_body.dart';
import 'package:flutter_bloc_example/bloc/user_bloc.dart';
import 'package:flutter_bloc_example/bloc/user_event.dart';
import 'package:flutter_bloc_example/bloc/user_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(FetchUserEvents());
    return Scaffold(
      appBar: AppBar(
        title: Text(user),
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState userState) {
          if (userState is UserLoadedState) {
            return UserBody(
              userData: userState.user.data!,
            );
          } else if (userState is UserErrorState) {
            return Center(
              child: Text(
                userState.error.message,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
