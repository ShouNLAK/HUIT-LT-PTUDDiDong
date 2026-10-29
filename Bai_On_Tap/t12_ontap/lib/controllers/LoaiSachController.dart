import 'package:t12_ontap/models/LoaiSach.dart';
import 'package:t12_ontap/utils/database_helper.dart';

class LoaiSachController{
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> insertTK(LoaiSach obj) async {
    final db = await _dbHelper.database;
    await db.insert('LoaiSach', obj.toMap());
  }

  Future<void> updateTK(LoaiSach obj) async {
    final db = await _dbHelper.database;
    await db.update('LoaiSach', obj.toMap(), where: 'maLoai = ?', whereArgs: [obj.maLoai]);
  }

  Future<void> removeTK(LoaiSach obj) async {
    final db = await _dbHelper.database;
    await db.delete('LoaiSach',where: 'maLoai = ?', whereArgs: [obj.maLoai]);
  }

  Future<List<LoaiSach>> fetchTK(LoaiSach obj) async {
    final db = await _dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('LoaiSach');
    return maps.map((object) => LoaiSach.fromMap(object)).toList();
  }
}