import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'webmobril.db');
    //todo database version updated after impl face code merge by vishw
    var db = await openDatabase(path, version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  _onCreate(Database db, int version) async {


    await db.execute("CREATE TABLE ProductCartListOffline (Id INTEGER PRIMARY KEY,"
        "productId TEXT,"
        "title TEXT,"
        "price TEXT,"
        "description INTEGER,"
        "category INTEGER,"
        "image TEXT,"
        "quantity TEXT"
        ")");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute('DROP TABLE IF EXISTS ProductCartListOffline;');
      await db.execute("CREATE TABLE ProductCartListOffline (Id INTEGER PRIMARY KEY,"
          "productId TEXT,"
          "title TEXT,"
          "price TEXT,"
          "description INTEGER,"
          "category INTEGER,"
          "image TEXT,"
          "quantity TEXT"
          ")");
    }

  }
  }

