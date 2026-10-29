import 'package:t12_ontap/models/TaiKhoan.dart';
import 'package:t12_ontap/utils/database_helper.dart';

class TaiKhoanController{
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> insertTK(TaiKhoan tk) async {
    final db = await _dbHelper.database;
    await db.insert('TaiKhoan', tk.toMap());
  }

  Future<void> updateTK(TaiKhoan tk) async {
    final db = await _dbHelper.database;
    await db.update('TaiKhoan', tk.toMap(), where: 'tenDangNhap = ?', whereArgs: [tk.tenDangNhap]);
  }

  Future<void> removeTK(TaiKhoan tk) async {
    final db = await _dbHelper.database;
    await db.delete('TaiKhoan',where: 'tenDangNhap = ?', whereArgs: [tk.tenDangNhap]);
  }

  Future<List<TaiKhoan>> fetchTK(TaiKhoan tk) async {
    final db = await _dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('TaiKhoan');
    return maps.map((obj) => TaiKhoan.fromMap(obj)).toList();
  }
}