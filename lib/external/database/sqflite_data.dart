import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:personal_finance_tcc/external/database/data/migration.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteData {
  static final SqfliteData instance = SqfliteData._init();
  SqfliteData._init();

  static Database? _database;
  final String _databaseName = 'financial.db';
  final int _version = 1;
  final _tables = Migration.tables;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // _database = await _getDatabase();

    return await _getDatabase();
    // return _database!;
  }

  void _createDb(Database db, int newVersion) async {
    Batch batch = db.batch();

    for (var table in _tables) {
      batch.execute(table);
    }

    await batch.commit();
    // List<dynamic> res = await batch.commit();
  }

  Future<Database> _getDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      // join(await getDatabasesPath(), _databaseName),
      onCreate: _createDb,
      version: _version,
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
