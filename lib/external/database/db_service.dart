import 'package:personal_finance_tcc/external/database/sqflite_data.dart';
import 'package:personal_finance_tcc/presenter/models/ports/model.dart';
import 'package:sqflite/sqflite.dart';

class DbService {
  static final DbService instance = DbService._init();
  DbService._init();

  Future<List> select(
    String tableName,
    Model model, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final Database db = await SqfliteData.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );

    return List.generate(
      maps.length,
      (i) {
        return model.fromJson(maps[i]);
      },
    );
  }

  Future<void> insert(
    String tableName,
    Model model,
  ) async {
    final Database db = await SqfliteData.instance.database;

    await db.insert(
      tableName,
      model.toJson(),
    );
  }

  Future<void> update(
    String tableName,
    Model model,
    String where,
    List<Object?>? whereArgs,
  ) async {
    final Database db = await SqfliteData.instance.database;

    await db.update(
      tableName, model.toJson(),
      where: where, //'$columnId = ?'
      whereArgs: whereArgs,
    );
  }

  Future<void> delete(
    String tableName,
    String where,
    List<Object?>? whereArgs,
  ) async {
    final Database db = await SqfliteData.instance.database;

    await db.delete(
      tableName,
      where: where, //'$columnId = ?'
      whereArgs: whereArgs,
    );
  }
}
