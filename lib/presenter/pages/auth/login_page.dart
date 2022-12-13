import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:personal_finance_tcc/presenter/stores/auth/auth_store.dart';
import 'package:personal_finance_tcc/presenter/widgets/custom_icon_button.dart';
import 'package:personal_finance_tcc/presenter/widgets/custom_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthStore authStore = AuthStore();
  ReactionDisposer? disposerAutorun;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    disposerAutorun!();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposerAutorun = autorun(((_) {
      if (authStore.isLogged) {
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
                          enabled: !authStore.formLogin.loadingSubmitted,
                          label: 'Usuário',
                          prefixIcon: const CustomIconButton(
                            iconData: Icons.account_circle,
                          ),
                          errorText: authStore.formLogin.error.username,
                          onChanged: (value) =>
                              authStore.formLogin.username = value ?? '',
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Observer(builder: (_) {
                        return CustomTextField(
                          enabled: !authStore.formLogin.loadingSubmitted,
                          label: 'Senha',
                          prefixIcon: const CustomIconButton(
                            iconData: Icons.vpn_key,
                          ),
                          suffixIcon: CustomIconButton(
                            iconData: !authStore.formLogin.passwordVisibily
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onPressed:
                                authStore.formLogin.toggleVisibilityPassword,
                          ),
                          obscureText: !authStore.formLogin.passwordVisibily,
                          errorText: authStore.formLogin.error.password,
                          onChanged: (value) =>
                              authStore.formLogin.password = value ?? '',
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
                            onPressed: authStore.login,
                            child: authStore.formLogin.loadingSubmitted
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
