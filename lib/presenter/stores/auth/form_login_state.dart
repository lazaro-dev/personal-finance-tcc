import 'package:mobx/mobx.dart';
part 'form_login_state.g.dart';

// ignore: library_private_types_in_public_api
class FormLoginState = _FormLoginState with _$FormLoginState;

abstract class _FormLoginState with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  bool passwordVisibily = false;

  @observable
  bool loadingSubmitted = false;

  @action
  void setUsername(String value) => username = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void toggleVisibilityPassword() => passwordVisibily = !passwordVisibily;

  void validateUsername(String value) {
    if (value.length < 3) {
      error.username = 'Usuário dever ter mais de 3 caracteres';
      return;
    }

    error.username = null;
  }

  @action
  void validatePassword(String value) {
    if (value.length < 3) {
      error.password = 'A senha precisa ter mais de 3 caracteres';
      return;
    }

    error.password = null;
  }

  void validateAll() {
    validatePassword(password);
    validateUsername(username);
  }
}

// ignore: library_private_types_in_public_api
class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? username;

  @observable
  String? password;

  @computed
  bool get hasErrors => username != null || password != null;
}
