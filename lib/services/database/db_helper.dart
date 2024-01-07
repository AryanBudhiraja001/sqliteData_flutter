import 'package:path/path.dart';
import 'package:search_task/services/database/table_name.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper {
  static const _databaseName = "local.db";
  static const _databaseVersion = 1;

  //static const table = 'localData';

  static const columnId = '_id';
  static const image = 'ImageUrl';
  //static const url = 'URL';
  static const option = 'Option';
  static const qrCode = 'QRCode';
  static const mrp = 'MRP';
  static const subCategory = 'SubCategory';
 //static late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  // Future<void> init() async {
  //   final documentsDirectory = await getApplicationDocumentsDirectory();
  //   final path = join(documentsDirectory.path, _databaseName);
  //   _db = await openDatabase(
  //     path, version: _databaseVersion,
  //     onCreate: _onCreate,
  //   );
  // }


  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, _databaseName);
    var database = await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
    return database;
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    const String categoryTable = TableName.product;
    await db.execute('''
          CREATE TABLE $categoryTable (
            $columnId INTEGER PRIMARY KEY,
            $image TEXT,
            $option TEXT,
            $qrCode TEXT,
            $mrp TEXT,
            $subCategory TEXT
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.

  // static Future<int> insertDataList(Map<String, dynamic> row) async {
  //   return await _db.insert(table, row);
  // }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.

  // Future<List<Map<String, dynamic>>> queryAllRows() async {
  //   return await _db.query(table);
  // }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.

  // Future<int> queryRowCount() async {
  //   final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
  //   return Sqflite.firstIntValue(results) ?? 0;
  // }



  // particulardatequeryData(Map<String, dynamic> row) async {
  //   String id = row[reportedDate];
  //   var dbData = await _db.query(table, where: '$reportedDate = ?', whereArgs: [id],limit: 1);
  //   if(dbData.isEmpty){
  //     print("null db");
  //     return true;
  //   }else {
  //     print("not null db");
  //     return await _db.query(table, where: '$reportedDate = ?', whereArgs: [id],limit: 1);
  //
  //   }
  //
  // }


  // Future<int> update(Map<String, dynamic> row) async {
  //   String id = row[reportedDate];
  //   return await _db.update(
  //     table,
  //     row,
  //     where: '$reportedDate = ?',
  //     whereArgs: [id],
  //   );
  // }


  // Future<int> delete(int id) async {
  //   return await _db.delete(
  //     table,
  //     where: '$columnId = ?',
  //     whereArgs: [id],
  //   );
  // }
}


