import 'package:personal_finance_tcc/services/auth_service.dart';

class AuthController {
  final AuthService authService = AuthService();
  String _username = '';
  String _password = '';

  set setUsername(String value) => _username = value;
  String get username => _username;

  set setPassword(String value) => _password = value;

  Future<bool> login() async {
    return await authService.login(username: username, password: _password);
  }

  Future<bool> logout() async {
    return await authService.logout();
  }
}
