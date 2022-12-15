import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite {
  static final Sqflite instance = Sqflite._init();
  Sqflite._init();

  static Database? _database;
  final String _databaseName = 'financial.db';
  final int _version = 1;
  final _tables = [
    'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, username TEXT, email TEXT, phone TEXT, image TEXT, password TEXT)',
    'CREATE TABLE account_types (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, slug TEXT)',
    'CREATE TABLE institutions (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, image TEXT)',
    '''CREATE TABLE accounts (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, balance DECIMAL(10,2), 
        account_type_id INTEGER, FOREIGN KEY(account_type_id) REFERENCES account_types(id))''',
    '''CREATE TABLE transactions (id INTEGER PRIMARY KEY AUTOINCREMENT, observation TEXT, image TEXT,
        from_account_id INTEGER, to_account_id INTEGER,
        FOREIGN KEY(from_account_id) REFERENCES accounts(id),
        FOREIGN KEY(to_account_id) REFERENCES accounts(id))''',
  ];

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _getDatabase();

    return _database!;
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
    return await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: _createDb,
      version: _version,
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
