import 'package:flutter/material.dart';
import 'package:personal_finance_tcc/presenter/stores/auth/auth_store.dart';
import 'package:personal_finance_tcc/presenter/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:personal_finance_tcc/presenter/widgets/menu/menu_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthStore authStore = AuthStore();

  @override
  void initState() {
    super.initState();
    // authStore.
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MenuDrawer(),
        // ignore: prefer_const_constructors
        appBar: AppBarCustom(title: ''),
        resizeToAvoidBottomInset: false,
        body: Container(
          color: const Color.fromARGB(255, 245, 241, 241),
          // padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: [
                  // ],
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
