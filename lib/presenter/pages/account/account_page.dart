import 'package:flutter/material.dart';
import 'package:personal_finance_tcc/presenter/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:personal_finance_tcc/presenter/widgets/expandable_fab/expandable_fab.dart';
import 'package:personal_finance_tcc/presenter/widgets/menu/menu_drawer.dart';

class AccountPage extends StatelessWidget {
  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];

  const AccountPage({super.key});

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
        body: Container(
          color: const Color.fromARGB(255, 245, 241, 241),
        ),
        floatingActionButton: ExpandableFab(
          backgroundButton: Theme.of(context).primaryColor,
          iconColor: Theme.of(context).colorScheme.onSecondary,
          distance: 80.0,
          children: [
            ActionButton(
              onPressed: () => _showAction(context, 0),
              icon: const Icon(Icons.format_size),
            ),
            ActionButton(
              onPressed: () => _showAction(context, 1),
              icon: const Icon(Icons.insert_photo),
            ),
            ActionButton(
              onPressed: () => _showAction(context, 2),
              icon: const Icon(Icons.videocam),
            ),
          ],
        ),
      ),
    );
  }
}
