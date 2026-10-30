import 'package:nguyen_le_anh_khoa_2001240206/models/TaiKhoan.dart';
import 'package:nguyen_le_anh_khoa_2001240206/utils/DatabaseHelper.dart';

class TaiKhoanController{
  static DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> insertTK (TaiKhoan tk) async {
    final db = await dbHelper.database;
    await db.insert('TaiKhoan', tk.toMap());
  }

  Future<void> removeTK (TaiKhoan tk) async {
    final db = await dbHelper.database;
    await db.delete('TaiKhoan',where: 'user = ?', whereArgs: [tk.user]);
  }

  Future<void> updateTK (TaiKhoan tk) async {
    final db = await dbHelper.database;
    await db.update('TaiKhoan', tk.toMap(), where: 'user = ?', whereArgs: [tk.user]);
  }

  Future<bool> isExistTK (TaiKhoan tk) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('TaiKhoan', where: 'user = ?', whereArgs: [tk.user]);
    return maps.isNotEmpty;
  }

  Future<List<TaiKhoan>> searchTK (TaiKhoan tk) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('TaiKhoan', where: 'user = ?', whereArgs: [tk.user]);
    return maps.map((obj) => TaiKhoan.fromMap(obj)).toList();
  }

  Future<List<TaiKhoan>> fetchTK () async {
    final db = await dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('TaiKhoan');
    return maps.map((obj) => TaiKhoan.fromMap(obj)).toList();
  }
}