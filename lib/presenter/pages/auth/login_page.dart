import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:personal_finance_tcc/presenter/stores/auth/login_store.dart';
import 'package:personal_finance_tcc/presenter/widgets/custom_icon_button.dart';
import 'package:personal_finance_tcc/presenter/widgets/custom_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final AuthController authController = AuthController();
  final LoginStore loginStore = LoginStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    autorun(((_) {
      if (loginStore.isLogged) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.white,
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Observer(builder: (_) {
                        return CustomTextField(
                          enabled: !loginStore.formLogin.loadingSubmitted,
                          label: 'Usuário',
                          prefixIcon: const CustomIconButton(
                            iconData: Icons.account_circle,
                          ),
                          errorText: loginStore.formLogin.error.username,
                          onChanged: (value) =>
                              loginStore.formLogin.username = value ?? '',
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Observer(builder: (_) {
                        return CustomTextField(
                          enabled: !loginStore.formLogin.loadingSubmitted,
                          label: 'Senha',
                          prefixIcon: const CustomIconButton(
                            iconData: Icons.vpn_key,
                          ),
                          suffixIcon: CustomIconButton(
                            iconData: !loginStore.formLogin.passwordVisibily
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onPressed:
                                loginStore.formLogin.toggleVisibilityPassword,
                          ),
                          obscureText: !loginStore.formLogin.passwordVisibily,
                          errorText: loginStore.formLogin.error.password,
                          onChanged: (value) =>
                              loginStore.formLogin.password = value ?? '',
                        );
                      }),
                      const SizedBox(
                        height: 32,
                      ),
                      Observer(builder: (_) {
                        return SizedBox(
                          width: 120,
                          height: 44,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Theme.of(context).primaryColor,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              loginStore.formLogin.validateAll();

                              if (!loginStore.formLogin.error.hasErrors) {
                                loginStore.login();
                              }
                            },
                            child: loginStore.formLogin.loadingSubmitted
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text('Entrar'),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
