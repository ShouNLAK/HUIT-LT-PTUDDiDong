import 'package:b10_nguyen_le_anh_khoa_2001240206/BTHD/models/task.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTHD/utils/database_helper.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TaskController {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> insertTask (Task task) async {
    final db = await _dbHelper.database;
    await db.insert('tasks', task.toMap());
  }

  Future<void> updateTask (Task task) async {
    final db = await _dbHelper.database;
    await db.update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<void> deleteTask (int id) async {
    final db = await _dbHelper.database;
    await db.delete('tasks',where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isTaskExist (String title) async {
    final db = await _dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('tasks',where: 'title = ?', whereArgs: [title]);
    return maps.isNotEmpty;
  }

  Future<List<Task>> searchTasks (String query) async {
    final db = await _dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('tasks',where: 'title LIKE ? OR description LIKE ?', whereArgs: ['%$query%','%$query%']);
    return maps.map((obj) => Task.fromMap(obj)).toList();
  }

  Future<List<Task>> fetchTasks() async {
    final db = await _dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('tasks');
    return maps.map((obj) => Task.fromMap(obj)).toList();
  }
}