import 'package:mobx/mobx.dart';
import 'package:personal_finance_tcc/presenter/models/User.dart';
import 'package:personal_finance_tcc/presenter/stores/auth/form_login_state.dart';
import 'package:personal_finance_tcc/services/auth_service.dart';
part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final FormLoginState formLogin = FormLoginState();
  final AuthService _authService = AuthService();
  User? user;

  @observable
  bool isLogged = false;

  Future<void> login() async {
    formLogin.validateAll();
    formLogin.loadingSubmitted = true;

    if (!formLogin.error.hasErrors) {
      await Future.delayed(const Duration(seconds: 2));

      bool result = await _authService.login(
          username: formLogin.username, password: formLogin.password);

      if (result) isLogged = true;
    }

    formLogin.loadingSubmitted = false;
  }

  Future<bool> logout() async {
    return await _authService.logout();
  }

  Future<User?> getUser() async {
    user = await _authService.getUser();
    return user;
  }
}
