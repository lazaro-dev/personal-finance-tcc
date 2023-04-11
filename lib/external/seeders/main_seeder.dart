import 'package:personal_finance_tcc/external/seeders/account_type_seeder.dart';

class MainSeeder {
  static Future<void> execute() async {
    await Future.wait([
      AccountTypeSeeder.reset(),
    ]);

    await Future.wait([
      AccountTypeSeeder.execute(),
    ]);
  }
}
