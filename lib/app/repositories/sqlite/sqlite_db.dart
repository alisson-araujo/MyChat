import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteDb {
  SqliteDb._();

  static final SqliteDb instance = SqliteDb._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'mychat.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_chat);
    await db.execute(_message);
  }

  String get _chat => '''
    CREATE TABLE chat(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      numberContact TEXT,
      nameContact TEXT,
      lastMsg TEXT,
      lastMsgTime TEXT,
      numberMsgNotread INTEGER,
      read INTEGER,
      UNIQUE(numberContact)
    )
  ''';

  String get _message => '''
    CREATE TABLE message(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_chat INTEGER NOT NULL,
      content TEXT,
      send_date DATETIME NOT NULL,
      receive_date DATETIME,
      is_received INTEGER DEFAULT 0,
      FOREIGN KEY (id_chat) REFERENCES chat(id)
    )
  ''';
}
