import 'package:flutter/material.dart';
import 'package:personal_finance_tcc/app.dart';
import 'package:personal_finance_tcc/external/database/db_service.dart';
import 'package:personal_finance_tcc/external/seeders/main_seeder.dart';
import 'package:personal_finance_tcc/presenter/models/account_type.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer';
void main() async {
  runApp(const App());

  WidgetsFlutterBinding.ensureInitialized();
  await MainSeeder.execute();
  var db = DbService.instance;

  var result = await db.select(AccountType.table, AccountType());

  // ignore: avoid_print
  // print('Aqui');
  // ignore: avoid_print
  // print(result);
  inspect(result);
}
