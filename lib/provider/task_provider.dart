import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_learn_getx/data_models/task_model.dart';

class TaskProvider {
  static const databaseName = 'task_db.db';
  static const databaseVersion = 1;
  static const tableName = 'tasks';

  Database? database;

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final dbPath = path.join(databasesPath, databaseName);

    database = await openDatabase(
      dbPath,
      version: databaseVersion,
      onCreate: _onCreate,
    );
    return database!;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $tableName (id TEXT PRIMARY KEY, name TEXT, status INTEGER)'
    );
  }

  Future<int> insertTask(Task task) async {
    if (database == null) {return 0;}
    return await database!.rawInsert(
      '''
      INSERT OR REPLACE INTO $tableName (id, name, status)
      VALUES (?, ?, ?)
      ''',
      [task.id, task.name, task.status.index],
    );
  }

  Future<int> updateTask(Task task) async {
    if (database == null) {return 0;}
    return await database!.rawUpdate(
      '''
      UPDATE $tableName
      SET name = ?, status = ?
      WHERE id = ?
      ''',
      [task.name, task.status.index, task.id],
    );    
  }

  Future<int> deleteTask(String id) async {
    if (database == null) { return 0;}
    return await database!.rawDelete(
      '''
      DELETE FROM $tableName
      WHERE id = ?
      ''',
      [id],
    );
  }

  Future<List<Task>> getAllTasks() async {
    if (database == null) {return [];}
    final List<Map<String, dynamic>> maps = await database!.rawQuery(
      'SELECT * FROM $tableName',
    );
    return List.generate(maps.length, (i) {
      return Task.fromJson(maps[i]);
    });
  }

  Future<void> deleteAllTasks() async {
    if (database == null) { return;}
    await database!.rawDelete('DELETE FROM $tableName');
  }
}