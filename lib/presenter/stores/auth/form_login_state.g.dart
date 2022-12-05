// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_login_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormLoginState on _FormLoginState, Store {
  late final _$usernameAtom =
      Atom(name: '_FormLoginState.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormLoginState.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordVisibilyAtom =
      Atom(name: '_FormLoginState.passwordVisibily', context: context);

  @override
  bool get passwordVisibily {
    _$passwordVisibilyAtom.reportRead();
    return super.passwordVisibily;
  }

  @override
  set passwordVisibily(bool value) {
    _$passwordVisibilyAtom.reportWrite(value, super.passwordVisibily, () {
      super.passwordVisibily = value;
    });
  }

  late final _$loadingSubmittedAtom =
      Atom(name: '_FormLoginState.loadingSubmitted', context: context);

  @override
  bool get loadingSubmitted {
    _$loadingSubmittedAtom.reportRead();
    return super.loadingSubmitted;
  }

  @override
  set loadingSubmitted(bool value) {
    _$loadingSubmittedAtom.reportWrite(value, super.loadingSubmitted, () {
      super.loadingSubmitted = value;
    });
  }

  late final _$_FormLoginStateActionController =
      ActionController(name: '_FormLoginState', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_FormLoginStateActionController.startAction(
        name: '_FormLoginState.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_FormLoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_FormLoginStateActionController.startAction(
        name: '_FormLoginState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormLoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibilityPassword() {
    final _$actionInfo = _$_FormLoginStateActionController.startAction(
        name: '_FormLoginState.toggleVisibilityPassword');
    try {
      return super.toggleVisibilityPassword();
    } finally {
      _$_FormLoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_FormLoginStateActionController.startAction(
        name: '_FormLoginState.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_FormLoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
passwordVisibily: ${passwordVisibily},
loadingSubmitted: ${loadingSubmitted}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  late final _$usernameAtom =
      Atom(name: '_FormErrorState.username', context: context);

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormErrorState.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
hasErrors: ${hasErrors}
    ''';
  }
}
