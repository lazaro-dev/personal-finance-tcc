import 'package:flutter/material.dart';
import 'package:personal_finance_tcc/presenter/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:personal_finance_tcc/presenter/widgets/expandable_fab/expandable_fab.dart';
import 'package:personal_finance_tcc/presenter/widgets/menu/menu_drawer.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final List<String> _actionTitles = ['Criar', 'Atualizar'];
  final List<String> accounts = [
    'Corrente', 'Carteira', 'Poupança'
  ];

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MenuDrawer(),
        appBar: const AppBarCustom(title: 'Contas'),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: accounts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ListTile(
                      leading: const Icon(Icons.balance),
                      title: Text(accounts[index]),
                      onTap: () {},
                    ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: ExpandableFab(
          backgroundButton: Theme.of(context).primaryColor,
          iconColor: Theme.of(context).colorScheme.onSecondary,
          distance: 80.0,
          children: [
            ActionButton(
              onPressed: () => _showAction(context, 0),
              icon: const Icon(Icons.transfer_within_a_station),
            ),
            ActionButton(
              onPressed: () => _showAction(context, 1),
              icon: const Icon(Icons.insert_chart),
            ),
            ActionButton(
              onPressed: () => _showAction(context, 2),
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
