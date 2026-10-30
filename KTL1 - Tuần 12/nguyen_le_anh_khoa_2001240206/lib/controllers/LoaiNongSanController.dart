import 'package:nguyen_le_anh_khoa_2001240206/models/LoaiNongSan.dart';
import 'package:nguyen_le_anh_khoa_2001240206/utils/databasehelper.dart';

class LoaiNongSanController{
    final DatabaseHelper dbHelper = DatabaseHelper();

    Future<void> insertLNS (LoaiNongSan LNS) async {
    final db = await dbHelper.database;
    await db.insert('LoaiNongSan', LNS.toMap());
  }

  Future<void> removeLNS (LoaiNongSan LNS) async {
    final db = await dbHelper.database;
    await db.delete('LoaiNongSan',where: 'maLoai = ?', whereArgs: [LNS.maLoai]);
  }

  Future<void> updateLNS (LoaiNongSan LNS) async {
    final db = await dbHelper.database;
    await db.update('LoaiNongSan', LNS.toMap(), where: 'maLoai = ?', whereArgs: [LNS.maLoai]);
  }

  Future<bool> isExistLNS (LoaiNongSan LNS) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('LoaiNongSan', where: 'maLoai = ?', whereArgs: [LNS.maLoai]);
    return maps.isNotEmpty;
  }

  Future<List<LoaiNongSan>> searchLNS (LoaiNongSan LNS) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('LoaiNongSan', where: 'maLoai = ?', whereArgs: [LNS.maLoai]);
    return maps.map((obj) => LoaiNongSan.fromMap(obj)).toList();
  }

  Future<List<LoaiNongSan>> fetchLNS () async {
    final db = await dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('LoaiNongSan');
    return maps.map((obj) => LoaiNongSan.fromMap(obj)).toList();
  }
}