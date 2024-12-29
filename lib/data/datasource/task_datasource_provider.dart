//Task veri kaynağı için provider

import 'package:gorevim/data/data.dart';
import 'package:gorevim/utils/utils.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Görev veritabanı işlemlerini yöneten sınıf
class TaskDatasource {
  static final TaskDatasource _instance = TaskDatasource._();

  factory TaskDatasource() => _instance;

  TaskDatasource._() {
    _initDb();
  }

  static Database? _database;

  // Veritabanı örneğini döndürür
  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  // Veritabanını başlatır
  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Veritabanı oluşturma işlemi
  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppKeys.dbTable} (
        ${TaskKeys.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TaskKeys.title} TEXT,
        ${TaskKeys.note} TEXT,
        ${TaskKeys.date} TEXT,
        ${TaskKeys.time} TEXT,
        ${TaskKeys.category} TEXT,
        ${TaskKeys.isCompleted} INTEGER
      )
    ''');
  }

  // Yeni bir görev ekler
  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        AppKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  // Tüm görevleri alır
  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      AppKeys.dbTable,
      orderBy: "id DESC",
    );
    return List.generate(
      maps.length,
      (index) {
        return Task.fromJson(maps[index]);
      },
    );
  }

  // Bir görevi günceller
  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        AppKeys.dbTable,
        task.toJson(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    });
  }

  // Bir görevi siler
  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          AppKeys.dbTable,
          where: 'id = ?',
          whereArgs: [task.id],
        );
      },
    );
  }
}
