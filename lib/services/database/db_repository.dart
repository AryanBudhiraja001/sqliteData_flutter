
import 'package:search_task/model/dashboadModel.dart';
import 'package:search_task/services/database/db_helper.dart';
import 'package:search_task/services/database/table_name.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DbRepository {
  late DatabaseHelper _databaseConnection;
  DbRepository() {
    _databaseConnection = DatabaseHelper();
  }

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  // Future<List<Products>> readData(table) async {
  //   // Get a reference to the database.
  //   final db = await database;
  //
  //   // Query the table for all The Dogs.
  //   final List<Map<String, dynamic>> maps = await db!.query(table);
  //
  //   // Convert the List<Map<String, dynamic> into a List<Dog>.
  //   return List.generate(maps.length, (i) {
  //     return Products(
  //       season: maps[i]['season'],
  //       name: maps[i]['name'],
  //       option: maps[i]['option'],
  //     );
  //   });
  // }

  ///Read All Record
  readData(table) async {
    var connection = await database;
    return await connection?.rawQuery("SELECT * FROM  $table");
  } //Read All Record





  //Read a Single Record By ID
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }
  // static const option = 'Option';
  // static const qrCode = 'QRCode';
  readDataByProductName(table, itemId) async {
    var connection = await database;
    return await connection
        ?.rawQuery(
        "SELECT * FROM ${table} WHERE Option LIKE '%${itemId}%' OR  QRCode LIKE '%${itemId}%'");
  }



  //Update User
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Delete User
  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }

  deleteDataByProductName(table, itemId) async {
    var connection = await database;
    return await connection
        ?.delete(table, where: 'productName = ?', whereArgs: [itemId]);
  }



  deleteAllData(table) async {
    var connection = await database;
    return await connection?.rawQuery(
        "DELETE FROM $table");
  }
// //Delete User
// maxDataById(table) async {
//   var connection = await database;
//   return await connection?.query("SELECT MAX(maxId) FROM $table");
// }
}
