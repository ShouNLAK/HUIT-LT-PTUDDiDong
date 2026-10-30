import 'package:nguyen_le_anh_khoa_2001240206/models/HoaDon.dart';
import 'package:nguyen_le_anh_khoa_2001240206/utils/databasehelper.dart';

class HoaDonController {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> insertHD (HoaDon hd) async {
    final db = await dbHelper.database;
    await db.insert('HoaDon', hd.toMap());
  }

  Future<void> removeHD (HoaDon hd) async {
    final db = await dbHelper.database;
    await db.delete('HoaDon',where: 'maLoai = ?', whereArgs: [hd.maHD]);
  }

  Future<void> updateHD (HoaDon hd) async {
    final db = await dbHelper.database;
    await db.update('LoaiNongSan', hd.toMap(), where: 'maLoai = ?', whereArgs: [hd.maHD]);
  }

  Future<bool> isExistHD (HoaDon hd) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('LoaiNongSan', where: 'maLoai = ?', whereArgs: [hd.maHD]);
    return maps.isNotEmpty;
  }

  Future<List<HoaDon>> searchHD (HoaDon hd) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('LoaiNongSan', where: 'maLoai = ?', whereArgs: [hd.maHD]);
    return maps.map((obj) => HoaDon.fromMap(obj)).toList();
  }

    Future<List<HoaDon>> fetchHD () async {
    final db = await dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('HoaDon');
    return maps.map((obj) => HoaDon.fromMap(obj)).toList();
  }
}