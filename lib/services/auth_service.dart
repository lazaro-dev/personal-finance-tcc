import 'dart:convert';

import 'package:personal_finance_tcc/helpers/local_store_service.dart';
import 'package:personal_finance_tcc/presenter/models/user.dart';
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

    sharedPreferences.setString('user', jsonEncode({username: username}));

    return true;
  }

  Future<bool> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.remove('user');

    return true;
  }

  getUser() async {
    final String? strUser = await LocalStoreHelper.instance.getString('user');

    if (strUser == null) return null;

    final jsonUser = json.decode(strUser);

    return User().fromJson(jsonUser);
  }
}
