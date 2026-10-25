import 'package:b10_nguyen_le_anh_khoa_2001240206/BTVN1/models/ChiTieu.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTVN1/utils/database_helper.dart';

class ChiTieuController {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> insert(ChiTieu ct) async {
    final db = await _dbHelper.database;
    await db.insert('chitieu', ct.toMap());
  }

  Future<void> update(ChiTieu ct) async {
    final db = await _dbHelper.database;
    await db.update(
      'chitieu',
      ct.toMap(),
      where: 'id = ?',
      whereArgs: [ct.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await _dbHelper.database;
    await db.delete('chitieu', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isExist(String name) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'chitieu',
      where: 'noiDungChiTieu = ?',
      whereArgs: [name],
    );
    return maps.isNotEmpty;
  }

  Future<List<ChiTieu>> search(String query) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'chitieu',
      where: 'noiDungChiTieu LIKE ? OR ghiChu LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
    );
    return maps.map((obj) => ChiTieu.fromMap(obj)).toList();
  }

  Future<List<ChiTieu>> fetch() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('chitieu');
    return maps.map((obj) => ChiTieu.fromMap(obj)).toList();
  }

  Future<int> getTotalAmount() async {
    final db = await _dbHelper.database;
    final result = await db.rawQuery('SELECT SUM(soTien) as total FROM chitieu');
    if (result.isNotEmpty && result.first['total'] != null) {
      return (result.first['total'] as num).toInt();
    }
    return 0;
  }
}
