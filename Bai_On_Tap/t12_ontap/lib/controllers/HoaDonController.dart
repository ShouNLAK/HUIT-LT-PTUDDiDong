import 'package:t12_ontap/models/HoaDon.dart';
import 'package:t12_ontap/utils/database_helper.dart';

class HoaDonController{
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> insertTK(HoaDon obj) async {
    final db = await _dbHelper.database;
    await db.insert('HoaDon', obj.toMap());
  }

  Future<void> updateTK(HoaDon obj) async {
    final db = await _dbHelper.database;
    await db.update('HoaDon', obj.toMap(), where: 'maHD = ?', whereArgs: [obj.maHD]);
  }

  Future<void> removeTK(HoaDon obj) async {
    final db = await _dbHelper.database;
    await db.delete('HoaDon',where: 'maHD = ?', whereArgs: [obj.maHD]);
  }

  Future<List<HoaDon>> fetchTK(HoaDon obj) async {
    final db = await _dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('HoaDon');
    return maps.map((object) => HoaDon.fromMap(object)).toList();
  }
}