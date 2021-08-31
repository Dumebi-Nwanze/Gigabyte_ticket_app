import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'model/settings_model.dart';

class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String LINK = 'link';
  static const String TABLE = 'Settings';
  static const String DB_NAME = 'settings.db';

  Future<Database> get db async => _db ??= await initDb();

  Future<Database> initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $LINK TEXT)");
  }

  Future<Settings> insert(Settings settings) async {
    var dbClient = await db;
    settings.id = await dbClient.insert(TABLE, settings.toMap());
    return settings;
  }

  Future<int> update(Settings settings) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, settings.toMap(),
        where: '$ID = ?', whereArgs: [settings.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
