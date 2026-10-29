import 'package:t12_ontap/models/ChonSach.dart';
import 'package:t12_ontap/utils/database_helper.dart';

class ChonSachController{
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> insertTK(ChonSach obj) async {
    final db = await _dbHelper.database;
    await db.insert('ChonSach', obj.toMap());
  }

  Future<void> updateTK(ChonSach obj) async {
    final db = await _dbHelper.database;
    await db.update('ChonSach', obj.toMap(), where: 'id = ?', whereArgs: [obj.id]);
  }

  Future<void> removeTK(ChonSach obj) async {
    final db = await _dbHelper.database;
    await db.delete('ChonSach',where: 'id = ?', whereArgs: [obj.id]);
  }

  Future<List<ChonSach>> fetchTK(ChonSach obj) async {
    final db = await _dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('ChonSach');
    return maps.map((object) => ChonSach.fromMap(object)).toList();
  }
}