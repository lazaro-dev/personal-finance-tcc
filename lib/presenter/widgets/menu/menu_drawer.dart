import 'package:flutter/material.dart';
import 'package:personal_finance_tcc/presenter/stores/auth/auth_store.dart';
import 'package:personal_finance_tcc/presenter/widgets/menu/drawer_item.dart';
import 'package:personal_finance_tcc/presenter/widgets/menu/user_drawer_header.dart';

class MenuDrawer extends StatelessWidget {
  final AuthStore authStore = AuthStore();
  final String name = 'Iriney';
  MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        UserDrawerHeader(
          name: name,
          urlImage: 'https://avatars.githubusercontent.com/u/63379716?s=400&u=f809e9401ec8bf4f6d25b841130cad5dfb6505ab&v=4',
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 1,
          ),
          child: Column(
            children: [
              DrawerItem(
                title: 'Principal',
                icon: Icons.home,
                onTap: () => Navigator.pushNamed(context, '/home'),
              ),
              DrawerItem(
                title: 'Contas',
                icon: Icons.account_balance_wallet,
                onTap: () => Navigator.pushNamed(context, '/account'),
              ),
              const Divider(
                color: Colors.deepPurpleAccent,
              ),
              DrawerItem(
                title: 'Sair',
                icon: Icons.exit_to_app,
                onTap: () {
                  authStore.logout();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
