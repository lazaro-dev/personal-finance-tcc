import 'package:flutter/material.dart';
import 'package:personal_finance_tcc/presenter/controllers/auth_controller.dart';
import 'package:personal_finance_tcc/presenter/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authController = AuthController();

  final formKey = GlobalKey<FormState>();
  var username = '';
  var password = '';

  @override
  void initState() {
    super.initState();
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
              color: Colors.white70,
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        label: 'Usuário',
                        prefixIcon: Icons.account_circle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite um usuário';
                          }

                          return null;
                        },
                        onSaved: (value) =>
                            authController.setUsername = value ?? '',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        label: 'Senha',
                        prefixIcon: Icons.vpn_key,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite uma senha';
                          }

                          return null;
                        },
                        onSaved: (value) =>
                            authController.setPassword = value ?? '',
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: 120,
                        height: 44,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Theme.of(context).primaryColor,
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              bool result = await authController.login();

                              if (result) {
                                // ignore: use_build_context_synchronously
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                              }
                            }
                          },
                          child: const Text('Entrar'),
                        ),
                      ),
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
