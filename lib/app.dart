import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_tcc/presenter/pages/auth/login_page.dart';
import 'package:personal_finance_tcc/presenter/pages/home_page.dart';
import 'package:personal_finance_tcc/presenter/pages/welcome_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // te
      theme: ThemeData(
        useMaterial3: true,
        // primarySwatch: Colors.purple,
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
        // cupertinoOverrideTheme: const CupertinoThemeData(
        //   primaryColor: Colors.red,
        // ),
      ),

      // home: const Welcome(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const WelcomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
