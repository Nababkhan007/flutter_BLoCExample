import 'package:flutter_bloc_example/data/user.dart';
import 'package:flutter_bloc_example/service/user_api_provider.dart';

class UserRepository {
  Future<User> fetchUser()  => UserApiProvider().getUsers();
}
