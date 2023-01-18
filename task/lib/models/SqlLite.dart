import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqlLite {
  SqlLite._privateConstructor();
  static final SqlLite instance = SqlLite._privateConstructor();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "mimits.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _create,
    );
  }


  static Future _create(Database db, int version) async {
    await db.execute(
      'CREATE TABLE User (name TEXT, email TEXT, password TEXT,phone_number INTEGER)',
    );
    await db.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO User(name, email, password,phone_number) VALUES(?,?,?,?)',
          ['Yazan radaideh', 'yazan@gmail.com', 'yazan123', 0791490616]);
      print(id1);
      int id2 = await txn.rawInsert(
          'INSERT INTO User(name, email, password,phone_number) VALUES(?,?,?,?)',
          ['Omar radaideh', 'omar@gmail.com', 'omar123', 0777481208]);
      print(id2);
    });
  }
}
