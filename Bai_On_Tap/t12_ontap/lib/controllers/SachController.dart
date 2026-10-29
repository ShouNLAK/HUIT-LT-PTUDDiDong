import 'package:t12_ontap/models/Sach.dart';
import 'package:t12_ontap/utils/database_helper.dart';

class SachController{
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> insertTK(Sach obj) async {
    final db = await _dbHelper.database;
    await db.insert('Sach', obj.toMap());
  }

  Future<void> updateTK(Sach obj) async {
    final db = await _dbHelper.database;
    await db.update('Sach', obj.toMap(), where: 'maSach = ?', whereArgs: [obj.maSach]);
  }

  Future<void> removeTK(Sach obj) async {
    final db = await _dbHelper.database;
    await db.delete('Sach',where: 'maSach = ?', whereArgs: [obj.maSach]);
  }

  Future<List<Sach>> fetchTK(Sach obj) async {
    final db = await _dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('Sach');
    return maps.map((object) => Sach.fromMap(object)).toList();
  }
}