import 'package:personal_finance_tcc/external/database/db_service.dart';
import 'package:personal_finance_tcc/presenter/models/account.dart';

class AccountSeeder {
  static Future<void> execute() async {
    final DbService dbService = DbService.instance;

    final List<Account> accounts = [
      Account(name: 'Nubank', balance: '0', accountTypeId: 1),
      Account(name: 'Bradesco', balance: '0', accountTypeId: 2),
    ];

    List<Future<dynamic>> funcs = [];
    for (var accountType in accounts) {
      funcs.add(dbService.insert(Account.table, accountType));
    }

    await Future.wait(funcs);
  }

  static Future<void> reset() async {
    final DbService dbService = DbService.instance;

    await dbService.execute('DELETE FROM ${Account.table}');
  }
}
