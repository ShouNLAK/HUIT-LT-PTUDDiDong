import 'package:b10_nguyen_le_anh_khoa_2001240206/BTTL2/models/SinhVien.dart';
import 'package:b10_nguyen_le_anh_khoa_2001240206/BTTL2/utils/database_helper.dart';

class SinhvienController {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> insert(SinhVien task) async {
    final db = await _dbHelper.database;
    await db.insert('students', task.toMap());
  }

  Future<void> update(SinhVien task) async {
    final db = await _dbHelper.database;
    await db.update(
      'students',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await _dbHelper.database;
    await db.delete('students', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isStudentExist(String name) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'students',
      where: 'name = ?',
      whereArgs: [name],
    );
    return maps.isNotEmpty;
  }

  Future<List<SinhVien>> search(String query) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'students',
      where: 'name LIKE ? OR email LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
    );
    return maps.map((obj) => SinhVien.fromMap(obj)).toList();
  }

  Future<List<SinhVien>> fetch() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('students');
    return maps.map((obj) => SinhVien.fromMap(obj)).toList();
  }
}
