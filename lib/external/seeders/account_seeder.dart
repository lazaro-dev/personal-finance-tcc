import 'package:personal_finance_tcc/external/database/db_service.dart';
import 'package:personal_finance_tcc/presenter/models/account.dart';

class AccountSeeder {
  static void execute() async {
    final DbService dbService = DbService.instance;

    final Account account = new Account();

    // dbService.insert('account', account)
  }

  static void reset() {}
}
