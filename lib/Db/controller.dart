import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class DBController{

  static final _dbName = 'lojaTresPontos.db';
  static final _dbVersion = 1;
  static final _tableName = 'products';

  DBController._privateConstructor();
  static final DBController instance = DBController._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    //check if the db is already initialized
    if(_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path,
      version: _dbVersion,
      onCreate: _onCreate
    );
  }

  // ignore: missing_return
  Future _onCreate(Database db, int version) {
    db.execute(
      ''' 
      CREATE TABLE $_tableName(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
       name TEXT NOT NULL,
       style TEXT NOT NULL,
       code_color TEXT,
       color_slug TEXT,
       color TEXT,
       on_sale TEXT,
       regular_price REAL NOT NULL,
       actual_price REAL NOT NULL,
       discount_percentage REAL,
       installments TEXT,
       image BLOB)
      '''
    );
  }

  Future<int> insert(Map<String, dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future update(Map<String, dynamic> row) async{
    Database db = await instance.database;
    int id = row['_id'];
    return await db.update(_tableName, row, where: '_id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '_id = ?', whereArgs: [id]);
  }


}