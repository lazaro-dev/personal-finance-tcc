import 'package:personal_finance_tcc/external/database/db_service.dart';
import 'package:personal_finance_tcc/presenter/models/account_type.dart';

class AccountTypeSeeder {
  static Future<void> execute() async {
    final DbService dbService = DbService.instance;

    final List<AccountType> accountTypes = [
      AccountType(id: 1, name: 'Conta Corrente', slug: 'conta-corrente'),
      AccountType(id: 2, name: 'Conta Poupança', slug: 'conta-poupanca'),
      AccountType(id: 3, name: 'Carteira', slug: 'carteira'),
    ];

    List<Future<dynamic>> funcs = [];
    for (var accountType in accountTypes) {
      funcs.add(dbService.insert(AccountType.table, accountType));
    }

    await Future.wait(funcs);
  }

  static Future<void> reset() async {
    final DbService dbService = DbService.instance;

    await dbService.execute('DELETE FROM ${AccountType.table}');
  }
}
