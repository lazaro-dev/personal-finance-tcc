import 'package:flutter/material.dart';
import 'package:personal_finance_tcc/services/auth_service.dart';
import 'dart:async';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.isLogged().then((bool value) {
      if (value) {
        Timer(const Duration(seconds: 5), () {
          Navigator.pushNamed(context, '/home');
        });
      } else {
        Timer(const Duration(seconds: 5), () {
          Navigator.pushNamed(context, '/login');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bem vindo'),
      ),
    );
  }
}
