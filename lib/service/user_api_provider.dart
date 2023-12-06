import 'dart:convert';
import 'package:flutter_bloc_example/data/user.dart';
import 'package:flutter_bloc_example/helper/text.dart';
import 'package:flutter_bloc_example/service/status.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';

class UserApiProvider {
  Future<User> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl + userPath));
    if (response.statusCode == successStatus) {
      final String responseString = utf8.decode(response.bodyBytes);
      return userFromJson(responseString);
    } else {
      throw Exception(somethingWentWrong);
    }
  }
}
