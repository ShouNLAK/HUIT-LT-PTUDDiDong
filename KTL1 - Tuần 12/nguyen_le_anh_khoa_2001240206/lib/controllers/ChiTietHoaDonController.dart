import 'package:nguyen_le_anh_khoa_2001240206/models/ChiTietHoaDon.dart';
import 'package:nguyen_le_anh_khoa_2001240206/utils/databasehelper.dart';

class ChiTietHoaDonController {
  final DatabaseHelper dbHelper = DatabaseHelper();

    Future<void> insertCTHD (ChiTietHoaDon cthd) async {
    final db = await dbHelper.database;
    await db.insert('ChiTietHoaDon', cthd.toMap());
  }

  Future<void> removeCTHD (ChiTietHoaDon cthd) async {
    final db = await dbHelper.database;
    await db.delete('ChiTietHoaDon',where: 'id = ?', whereArgs: [cthd.id]);
  }

  Future<void> updateCTHD (ChiTietHoaDon cthd) async {
    final db = await dbHelper.database;
    await db.update('ChiTietHoaDon', cthd.toMap(), where: 'id = ?', whereArgs: [cthd.id]);
  }

  Future<bool> isExistCTHD (ChiTietHoaDon cthd) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('ChiTietHoaDon', where: 'id = ?', whereArgs: [cthd.id]);
    return maps.isNotEmpty;
  }

  Future<List<ChiTietHoaDon>> searchCTHD (ChiTietHoaDon cthd) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('ChiTietHoaDon', where: 'id = ?', whereArgs: [cthd.id]);
    return maps.map((obj) => ChiTietHoaDon.fromMap(obj)).toList();
  }

    Future<List<ChiTietHoaDon>> fetchCTHD () async {
    final db = await dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('ChiTietHoaDon');
    return maps.map((obj) => ChiTietHoaDon.fromMap(obj)).toList();
  }
}