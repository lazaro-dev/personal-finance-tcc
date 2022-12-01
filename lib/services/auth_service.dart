import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> isLogged() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? user = sharedPreferences.getString('user');

    return (user != null) ? true : false;
  }

  Future<bool> login(
      {required String username, required String password}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // print(username);
    sharedPreferences.setString('user', jsonEncode({username: username}));

    return true;
  }

  Future<bool> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.remove('user');

    return true;
  }
}
