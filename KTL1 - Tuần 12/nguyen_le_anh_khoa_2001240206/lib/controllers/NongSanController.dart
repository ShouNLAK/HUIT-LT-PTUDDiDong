import 'package:nguyen_le_anh_khoa_2001240206/models/NongSan.dart';
import 'package:nguyen_le_anh_khoa_2001240206/utils/databasehelper.dart';
import 'package:sqflite/sqlite_api.dart';

class NongSanController {
  final DatabaseHelper dbHelper = DatabaseHelper();

    Future<void> insertNS (NongSan ns) async {
    final db = await dbHelper.database;
    await db.insert('NongSan', ns.toMap());
  }

  Future<void> removeNS (NongSan ns) async {
    final db = await dbHelper.database;
    await db.delete('NongSan',where: 'maNS = ?', whereArgs: [ns.maNS]);
  }

  Future<void> updateNS (NongSan ns) async {
    final db = await dbHelper.database;
    await db.update('NongSan', ns.toMap(), where: 'maNS = ?', whereArgs: [ns.maNS]);
  }

  Future<bool> isExistNS (NongSan ns) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('NongSan', where: 'maNS = ?', whereArgs: [ns.maNS]);
    return maps.isNotEmpty;
  }

  Future<List<NongSan>> searchNS (NongSan ns) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('NongSan', where: 'maNS = ?', whereArgs: [ns.maNS]);
    return maps.map((obj) => NongSan.fromMap(obj)).toList();
  }

    Future<List<NongSan>> fetchNS () async {
    final db = await dbHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('NongSan');
    return maps.map((obj) => NongSan.fromMap(obj)).toList();
  }
}