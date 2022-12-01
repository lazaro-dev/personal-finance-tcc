import 'package:flutter/material.dart';
import 'package:personal_finance_tcc/presenter/controllers/auth_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text('Home'),
              SizedBox(
                // width: double.infinity,
                height: 20,
                child: ElevatedButton(
                  onPressed: () async {
                    await authController.logout();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: const Text('Sair'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
