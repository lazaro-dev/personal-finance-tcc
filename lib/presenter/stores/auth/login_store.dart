import 'package:mobx/mobx.dart';
import 'package:personal_finance_tcc/presenter/stores/auth/form_login_state.dart';
import 'package:personal_finance_tcc/services/auth_service.dart';
part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final FormLoginState formLogin = FormLoginState();
  final AuthService _authService = AuthService();

  @observable
  bool isLogged = false;

  Future<void> login() async {
    formLogin.loadingSubmitted = true;

    await Future.delayed(const Duration(seconds: 2));

    formLogin.loadingSubmitted = false;

    bool result = await _authService.login(
        username: formLogin.username, password: formLogin.password);

    if (result) {
      isLogged = true;
    }
  }
}
