import 'package:sqflite/sqflite.dart';
import 'package:task/models/SqlLite.dart';

class AuthModel {
  static Future<Map?> tryToLogin(String email, String password) async {
    Database db = await SqlLite.instance.database;
    //  List<Map> rows = await db.query("User");
    //  print(rows);
    List<String> columnsToSelect = [
      'phone_number',
      'name',
      'email',
    ];
    String whereString = 'email = ? AND password = ?';
    List<dynamic> whereArguments = [email, password];
    List<Map> result = await db.query(
      'User',
      columns: columnsToSelect,
      where: whereString,
      whereArgs: whereArguments,
    );
    print(result);
    if(result.isEmpty) return null;
    return result.first;
  }
}
