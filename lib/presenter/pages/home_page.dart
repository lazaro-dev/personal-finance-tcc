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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                      ),
                    ),
                    IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.exit_to_app),
                      onPressed: () {
                        authController.logout();
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                    ),
                  ],
                ),
              ),
              // Expanded(child: Card(child: Padding,))
            ],
          ),
        ),
      ),
    );
  }
}
