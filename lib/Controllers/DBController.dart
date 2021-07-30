import 'package:loja_tres_pontos/Controllers/JsonController.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:loja_tres_pontos/models/Product.dart';

class DBController{

  static final _dbName = 'lojaTresPontos.db';
  static final _dbVersion = 1;
  static final _tableName = 'products';

  DBController._privateConstructor();
  static final DBController instance = DBController._privateConstructor();
  static Database _database;

  Future<Database> get database async {
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

  _onCreate(Database db, int version) async {
      await db.execute(
          ''' 
      CREATE TABLE $_tableName(_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
       name TEXT NOT NULL,
       style TEXT,
       code_color TEXT,
       color_slug TEXT,
       color TEXT,
       on_sale TEXT,
       regular_price REAL NOT NULL,
       actual_price REAL,
       discount_percentage REAL,
       installments INTEGER,
       image TEXT NOT NULL)
      '''
      );
      await db.transaction((txn) async {
        JsonController().sendProductsToDB();
      });
  }

  Future<int> insert(Map<String, dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Product>> queryAll() async {
    Database db = await instance.database;
    var res =  await db.query(_tableName);

    List<Product> products = res.isNotEmpty ? res.map((p) => Product.fromMap(p)).
      toList(): [];

    return products;
  }

  Future<List<Map<String, dynamic>>> getOne(int id) async {
    Database db = await instance.database;
    return await db.query(_tableName, where: '_id = ?', whereArgs: [id]);
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