// ignore_for_file: depend_on_referenced_packages, unused_element

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Database? _database;
  static final DB db = DB._();
  static late String dbName;

  /// [initDB] Inicia la base de datos,
  DB._();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB(dbName);
    return _database!;
  }

  /// Obtiene la instancia de la base de datos.
  ///
  /// [dbName] Es el nombre del archivo de la base de datos.
  /// Dentro de la funcion [openDatabase] se puede usar el método [onCreate] para crear las tablas
  /// cuando se cree la base de datos.
  Future<Database> initDB(String dbName) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(
      documentsDirectory.path,
      dbName,
    );
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {},
    );
  }

  /// Devuelve un [String] del query necesario para crear una tabla en la base de datos.
  /// Por defecto todas las columnas seran de tipo [TEXT], se puede indicar si se quiere
  /// agregar una columna para el id y/o una columna para el estado ambos de tipo [INTEGER].
  String _buildCreateTableQuery(
      {required String tableName,
      required List<String> columns,
      bool addIdColumn = true,
      bool addEstadoColumn = true}) {
    String query = "CREATE TABLE $tableName (";
    if (addIdColumn) query += "id INTEGER PRIMARY KEY,";
    if (addEstadoColumn) query += "estado INTEGER DEFAULT 0,";
    for (String element in columns) {
      query += "$element TEXT,";
    }
    query = query.substring(0, query.length - 1);
    query += ")";
    return query;
  }

  /// Devuelve un [String] del query necesario para crear una tabla en la base de datos.
  /// Recibe un Map donde la [Key] es el nombre del campo y el [Value] el tipo de dato,
  /// este tipo de dato solo puede ser [INTEGER], [REAL] o [TEXT]
  /// [e.g] : {"nombre": "TEXT", "edad": "INTEGER"}
  String _buildCreateTableQueryFromMap(
      {required tableName,
      required Map<String, String> columns,
      bool addIdColumn = true}) {
    String query = "CREATE TABLE $tableName (";
    if (addIdColumn) query += "id INTEGER PRIMARY KEY,";
    for (MapEntry<String, String> element in columns.entries) {
      bool expression = element.value == "INTEGER" ||
          element.value == "TEXT" ||
          element.value == "REAL";
      if (!expression) {
        throw Exception("The value of the map must be INTEGER, TEXT or REAL");
      }
      query += "${element.key} ${element.value},";
    }
    query = query.substring(0, query.length - 1);
    query += ")";
    return query;
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }

  Future<int> insert(
      {required String table,
      required Map<String, dynamic> data,
      ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.replace}) async {
    final db = await database;
    int res =
        await db.insert(table, data, conflictAlgorithm: conflictAlgorithm);
    return res;
  }

  Future<Map<String, dynamic>> getItemById(
      {required String table, required int id}) async {
    final db = await database;
    List<Map<String, dynamic>> res =
        await db.query(table, where: 'id = ?', whereArgs: [id]);
    return res.first;
  }

  Future<List<Map<String, dynamic>>> getAllItemsFromTable(
      {required String table}) async {
    final db = await database;
    List<Map<String, dynamic>> res = await db.query(table);

    return res;
  }

  Future getAllItemsByStatus(
      {required String table, required int status}) async {
    final db = await database;
    List res = await db.query(table, where: 'estado = ?', whereArgs: [status]);

    return res;
  }

  Future<bool> deleteItemById({required String table, required int id}) async {
    final db = await database;
    int res = await db.delete(table, where: 'id = ?', whereArgs: [id]);
    return res > 0;
  }

  Future<bool> deleteWhere(
      {required String table, required String where}) async {
    final db = await database;
    int res = await db.delete(table, where: where);
    return res > 0;
  }

  Future<bool> dropTable({required String table}) async {
    final db = await database;
    int res = await db.delete(table);
    return res > 0;
  }

  Future<bool> updateItemsWhere(
      {required String table,
      required String where,
      required Map<String, dynamic> data,
      List<Object?>? whereArgs}) async {
    final db = await database;
    int res = await db.update(table, data, where: where, whereArgs: whereArgs);
    return res > 0;
  }

  Future<bool> updateItemById(
      {required String table,
      required Map<String, dynamic> data,
      required int id}) async {
    final db = await database;
    int res = await db.update(table, data, where: 'id = ?', whereArgs: [id]);
    return res > 0;
  }
}
